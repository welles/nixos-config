# Repository Instructions

## Architecture: `hosts` + `bundles` + `modules`

The repository separates *what a machine is* from *what a machine can do*.

- `hosts/<hostname>/` describes one concrete machine.
- `bundles/` holds named, reusable lists of imports.
- `modules/` holds host-independent, reusable building blocks.

Dependencies only point downwards:

```
hosts/    → imports bundles/ and modules/   (composition + host values)
bundles/  → imports modules/                (composition only)
modules/  → configuration                   (no host values)
```

A module must never import a bundle or anything from `hosts/`; a bundle must
never import anything from `hosts/`.

Some hosts and modules do not follow these rules yet. Treat the rules as the
target state: new code must follow them, and touching existing code is a good
opportunity to move it closer.

### Hosts contain only what cannot be abstracted

A host directory contains the minimum configuration that is inherently specific
to that one machine:

- `default.nix`: the list of imported modules, host-specific scalar values
  (`networking.hostName`, `networking.hostId`, `system.stateVersion`), and the
  module arguments in `_module.args`.
- Generated or hardware-bound files: `hardware-configuration.nix`,
  `disk-configuration.nix` (disko layout).
- `secrets.yaml` for secrets that belong to this machine only.

The ideal `default.nix` is nothing but `imports = [...]` plus
`_module.args = {...}` (and the few scalars above). If a host file contains
logic, services, packages, or persistence entries, that is a sign the
configuration should be extracted into a module, parameterised through module
arguments where needed.

All imports of a host are listed in its `default.nix`. Other files in the host
directory never import modules, so the host's feature set is visible in one
place.

Before adding anything to a host, check whether an existing module already
covers it or whether a second host could plausibly want the same thing. If so,
write or extend a module instead.

### Bundles group modules that belong together

A bundle (`bundles/<purpose>.nix`) is a named list of modules that several
hosts share, e.g. `dev-tools.nix` or `desktop-kde.nix`. Hosts stay explicit:
every entry in a host's `imports` is either a single feature (a module) or a
named, flat group of features (a bundle).

- A bundle contains **only** `imports`: no options, no configuration, no
  module arguments, no conditionals.

  ```nix
  {
    imports = [
      ../modules/packages/gh.nix
      ../modules/packages/lazygit.nix
      ../modules/packages/nodejs.nix
    ];
  }
  ```

- Bundles are flat: they import modules and package modules, never other
  bundles.
- Create a bundle only when at least two hosts need exactly that set. A bundle
  used by a single host is just a relocated list; keep it in the host.
- Name bundles after a role or purpose (`media.nix`, `impermanence-zfs.nix`),
  never after a host.
- Cut bundles so they are all-or-nothing. If a host needs "bundle X without
  module Y", split the bundle instead of using `disabledModules`.
- Importing the same module from several bundles or directly from the host is
  fine; the module system loads each path only once.
- Configuration that a group of hosts shares (e.g. base persistence entries)
  is not a bundle; it is a regular module, which a bundle may then import.

### Modules are self-contained feature units

Each file (or directory with `default.nix`) under `modules/` is one complete
feature for a host. Importing it must be enough to get a working feature;
nothing else may need to be configured on the host side except module
arguments.

- A module does not depend on being imported together with specific other
  modules unless it imports them itself.
- A module carries everything it needs: packages, services, firewall rules,
  users and groups, Home Manager configuration, secrets, and persistence
  entries.
- Secrets: a secret with the same value on every host lives in the module's
  own `secrets.yaml` (see `modules/rclone`). A secret whose value differs per
  host is declared by the module without `sopsFile` (owner, mode, …), and the
  host provides its value in its own `secrets.yaml`, its
  `sops.defaultSopsFile` (see `modules/cloudflared.nix`).
- A module never hard-codes host-specific values (usernames, paths, pool
  names, emails, keys). Those come from module arguments.
- Name modules after the feature they provide (`bluetooth.nix`,
  `zfs-rollback.nix`), not after the host that first needed them.

Think of `modules/` as a vending machine: hosts pick the features they need,
and not every module has to be in use. A module no host imports right now is
fine and stays, as long as it follows the rules and patterns described here,
so it works as soon as a host picks it.

### Package modules (`modules/packages/`)

Package modules are a special kind of module that revolve around a single
`nixpkgs` attribute and the configuration it needs to work. The file name
matches the attribute, also when the module uses a `programs.<name>` option:

- `firefox.nix` → `pkgs.firefox`, `mercurial.nix` → `programs.mercurial`
- nested attributes join with `-`: `kdePackages-dolphin.nix` →
  `pkgs.kdePackages.dolphin`, `nerd-fonts-fira-code.nix` →
  `pkgs.nerd-fonts.fira-code`
- the attribute's own leading `_` is kept (`_1password-gui.nix`), and a
  leading `_` is added when the attribute starts with a digit (`_7zz.nix`)
- programs that are not in `nixpkgs` are packaged in the module itself (or a
  directory with `default.nix`, e.g. `keeper-commander/`) and named after
  the program (`cheat-engine.nix`, `occt.nix`)

Modules that need a package another package module provides import that
module instead of installing the package again (e.g. `kdiff3.nix` imports
`fira-sans.nix` and `nerd-fonts-fira-code.nix` for the fonts it is set up
with).

A package module may bundle a small cluster of packages only when they must
always ship together (e.g. `keeper-commander/` with its locally packaged
dependencies). Anything broader — a desktop environment, a toolchain made of
independent tools — is a regular module that imports package modules.

Prefer the matching NixOS/Home Manager `programs.<name>` option over plain
`environment.systemPackages` when one exists, since it usually wires up
integration (polkit, firewall, desktop files) correctly.

### Impermanence is the module's responsibility

Hosts may run on an erase-your-darlings setup (ZFS root rolled back to
`@blank` on every boot). Such hosts import `bundles/impermanence-zfs.nix`,
which brings the rollback, the system-level base persistence
(`modules/impermanence-base.nix`) and the persistence audit scripts. Every module must
therefore declare all state it needs to survive a reboot, so that it works on
an impermanent host without the host adding anything:

```nix
{
  lib,
  user,
  persistRoot,
  ...
}: {
  programs.steam.enable = true;

  environment.persistence = lib.mkIf (persistRoot != null) {
    ${persistRoot}.users.${user}.directories = [".local/share/Steam"];
  };
}
```

- Guard persistence with `lib.mkIf (persistRoot != null)`, so the module also
  works on hosts without impermanence (those set `persistRoot = null`).
- Persist the narrowest paths possible (a config directory, not all of
  `.config`), and prefer `directories` over `files` unless the application
  replaces the file atomically in a way that breaks bind mounts.
- Impermanence rejects a path persisted twice. When several modules share
  state (e.g. all JetBrains IDEs), move the persistence into a small module
  they all import (see `modules/jetbrains-state.nix`); the module system
  loads it only once.
- When adding a package, find out where it stores state (config, cache that
  is expensive to rebuild, databases, login tokens) and persist it in the
  same module. `modules/scripts/persist-audit` and
  `modules/scripts/check-persist` help find unpersisted state on a running
  host.

### Host-specific data flows through module arguments

When a module needs a value that differs per host, it receives it as a module
argument that the host sets in `_module.args`. Common arguments:

| Argument               | Meaning                                                    |
| ---------------------- | ---------------------------------------------------------- |
| `hostname`             | Set by `flake.nix` via `specialArgs`.                      |
| `user`                 | Login name of the primary user.                            |
| `userDescription`      | Display name of the primary user.                          |
| `userEmail`            | Email of the primary user.                                 |
| `persistRoot`          | Impermanence persist root, or `null` without impermanence. |
| `pool`                 | ZFS pool name.                                             |
| `sopsAgeKeyFile`       | Path to the sops age key.                                  |
| `passwordConfig`       | Password attributes for the primary user's `users.users`.  |
| `extraGroups`          | Extra groups of the primary user.                          |
| `sshSigningKey`        | Public SSH key Git signs commits with.                     |
| `onePasswordVaults`    | 1Password vaults the SSH agent offers keys from.           |
| `sshAuthorizedKeys`    | Public keys allowed to log in over SSH.                    |
| `acmeEmail`            | Contact email for Caddy's ACME certificates.               |
| `msmtpAccount`         | SMTP account (`host`, `user`, `from`) of the mail relay.   |
| `nextcloudUrl`         | Nextcloud base URL the rclone mount uses.                  |
| `extraDiskMounts`      | Additional mount points the server status shows.           |
| `claudeWorkspaceRepos` | Repositories (`owner/repo`) of the Claude workspace.       |
| `timetrackerDevRepo`   | Working copy the time tracker deploys from, or `null`.     |
| `xrdpSession`          | Session command xrdp starts; set by `cinnamon.nix` itself. |

`xrdpSession` is the one argument a module sets (`cinnamon.nix` provides the
command that starts its own session). A module may provide an argument for
the modules that build on it this way; hosts never set it.

Rules:

- Reuse an existing argument before introducing a new one; keep names
  generic (`user`, not `nicoUser`).
- Every host must set every argument that any of its imported modules
  declares — including "optional" ones such as `persistRoot` (set it to
  `null`). Default values in a module's argument pattern
  (`persistRoot ? null`, `user ? throw "..."`) are **never used** by the
  NixOS module system: it always passes the attribute, and a missing one
  fails with `attribute '<name>' missing` while evaluating
  `config._module.args`. Do not write such defaults; express optionality
  as an explicit `null` set by the host.
- Module arguments cannot be used inside `imports` (infinite recursion).
  A module cannot import other modules conditionally based on them.
- Document a newly introduced argument in the table above.

### Home Manager

Every module is a NixOS module; there are no standalone Home Manager modules.
Home Manager configuration belongs to the module that provides the feature
and is injected through `home-manager.sharedModules`, so importing the module
on the host is enough. `modules/home-manager-user.nix` only declares the
primary user for Home Manager.

```nix
{userEmail, ...}: {
  home-manager.sharedModules = [
    {
      programs.git.settings.user.email = userEmail;
    }
  ];
}
```

- Read host-specific values from the NixOS module arguments of the outer
  function, as above. Do not pass them to Home Manager via
  `extraSpecialArgs`.
- When the Home Manager part needs Home Manager's own `config` or `lib`
  (e.g. `config.home.homeDirectory`, `lib.hm.dag`), make the shared module a
  function: `home-manager.sharedModules = [({config, ...}: {...})];`
  (see `modules/kde-theming.nix`).
- Host-specific Home Manager settings go into a file in the host directory
  following the same pattern (see `hosts/nixos-wsl-nixos/mercurial.nix`).

## After changing `.nix` files

Ensure every modified `.nix` file is formatted and linted:

1. Run `alejandra <file>` to apply consistent formatting.
2. Run `deadnix --edit <file>` to remove unused code and fix common issues.
3. Run `statix fix <file>` to apply automated linting fixes.
4. Run `statix check <file>` and fix any remaining linting errors manually.

## After implementing changes

1. Infer the hostname of the NixOS flake configuration being worked on. It may
   differ from the machine running Codex; check the `nixosConfigurations`
   attribute names in `flake.nix`.
2. Dry-build the configuration to check for errors: this evaluates the config
   and lists what would be built/fetched, without actually building or
   modifying the host — much faster than a full build.

   ```sh
   nix build .#nixosConfigurations.<hostname>.config.system.build.toplevel --dry-run
   ```

3. If the build fails, fix the errors and rebuild until it succeeds.

## Building new files

Nix flakes backed by Git ignore untracked files. Before building a configuration
that imports a new file, add the file to Git so Nix includes it in the flake
source.
