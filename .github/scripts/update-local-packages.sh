#!/usr/bin/env bash

set -euo pipefail

readonly EDEN_FILE="modules/eden.nix"
readonly OCCT_FILE="modules/occt/default.nix"
readonly KEEPER_FILE="modules/keeper.nix"
readonly NUKE_FILE="modules/nuke.nix"

fail() {
	echo "error: $*" >&2
	exit 1
}

read_single_value() {
	local file=$1
	local attribute=$2
	local -a values

	mapfile -t values < <(
		sed -nE "s/^[[:space:]]*${attribute} = \"([^\"]+)\";$/\\1/p" "$file"
	)

	[[ ${#values[@]} -eq 1 ]] ||
		fail "expected exactly one ${attribute} in ${file}, found ${#values[@]}"
	printf '%s\n' "${values[0]}"
}

read_first_hash() {
	local file=$1
	local -a values

	mapfile -t values < <(
		sed -nE 's/^[[:space:]]*hash = "([^"]+)";$/\1/p' "$file"
	)

	[[ ${#values[@]} -ge 1 ]] || fail "could not find a source hash in ${file}"
	printf '%s\n' "${values[0]}"
}

prefetch_hash() {
	local url=$1

	echo "Prefetching ${url}" >&2
	nix store prefetch-file --json --name package-source "$url" | jq -er '.hash'
}

replace_once() {
	local file=$1
	local old=$2
	local new=$3
	local output="${file}.updated"
	local count=0
	local line

	: >"$output"
	while IFS= read -r line || [[ -n $line ]]; do
		if [[ $line == *"$old"* ]]; then
			line=${line/"$old"/"$new"}
			((count += 1))
		fi
		printf '%s\n' "$line" >>"$output"
	done <"$file"

	[[ $count -eq 1 ]] || {
		rm -f -- "$output"
		fail "expected exactly one occurrence of '${old}' in ${file}, found ${count}"
	}
	mv -- "$output" "$file"
}

for file in "$EDEN_FILE" "$OCCT_FILE" "$KEEPER_FILE" "$NUKE_FILE"; do
	[[ -f $file ]] || fail "run this script from the repository root (${file} not found)"
done

eden_current_version=$(read_single_value "$EDEN_FILE" version)
eden_current_hash=$(read_first_hash "$EDEN_FILE")
occt_current_version=$(read_single_value "$OCCT_FILE" version)
occt_current_hash=$(read_first_hash "$OCCT_FILE")
keeper_current_version=$(read_single_value "$KEEPER_FILE" version)
keeper_current_hash=$(read_first_hash "$KEEPER_FILE")
nuke_current_version=$(read_single_value "$NUKE_FILE" version)
nuke_current_hash=$(read_single_value "$NUKE_FILE" nugetHash)

echo "Discovering current stable releases"

eden_releases=$(curl -fsSL \
	'https://git.eden-emu.dev/api/v1/repos/eden-emu/eden/releases?limit=20')
eden_release=$(
	jq -cer \
		'[.[] | select((.draft | not) and (.prerelease | not))] | first // error("no stable Eden release found")' \
		<<<"$eden_releases"
)
eden_tag=$(jq -er '.tag_name' <<<"$eden_release")
[[ $eden_tag == v* ]] || fail "unexpected Eden tag: ${eden_tag}"
eden_version=${eden_tag#v}
eden_asset="Eden-Linux-v${eden_version}-amd64-gcc-standard.AppImage"
eden_asset_count=$(
	jq -er --arg asset "$eden_asset" \
		'[.assets[] | select(.name == $asset)] | length' <<<"$eden_release"
)
[[ $eden_asset_count -eq 1 ]] ||
	fail "expected one Eden asset named ${eden_asset}, found ${eden_asset_count}"
eden_url="https://git.eden-emu.dev/eden-emu/eden/releases/download/v${eden_version}/${eden_asset}"

occt_html=$(curl -fsSL 'https://www.ocbase.com/download')
readonly OCCT_MARKER='<script id="__NEXT_DATA__" type="application/json">'
[[ $occt_html == *"$OCCT_MARKER"* ]] || fail 'OCCT release metadata was not found'
occt_json=${occt_html#*"$OCCT_MARKER"}
[[ $occt_json == *'</script>'* ]] || fail 'OCCT release metadata was not terminated'
occt_json=${occt_json%%'</script>'*}
occt_version=$(
	jq -er \
		'[.props.pageProps.occtReleasesLinux[] | select(.edition == "Personal") | .stable.release.version.versionStr] | if length == 1 then .[0] else error("expected one stable Personal Linux release") end' \
		<<<"$occt_json"
)
occt_url="https://www.ocbase.com/download-bin/edition:Personal/os:Linux/version:${occt_version}"

keeper_metadata=$(curl -fsSL \
	'https://download.keepersecurity.com/desktop_electron/Linux/repo/deb/dists/stable/main/binary-amd64/Packages')
mapfile -t keeper_versions < <(
	awk '
    BEGIN { RS = ""; FS = "\n" }
    {
      package = ""
      version = ""
      for (i = 1; i <= NF; i++) {
        if ($i ~ /^Package: /) {
          package = substr($i, 10)
        } else if ($i ~ /^Version: /) {
          version = substr($i, 10)
        }
      }
      if (package == "keeperpasswordmanager" && version != "") {
        print version
      }
    }
  ' <<<"$keeper_metadata"
)
[[ ${#keeper_versions[@]} -eq 1 && -n ${keeper_versions[0]} ]] ||
	fail "expected one Keeper package version, found ${#keeper_versions[@]}"
keeper_version=${keeper_versions[0]}
keeper_url="https://download.keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${keeper_version}_amd64.deb"

nuke_versions=$(curl -fsSL \
	'https://api.nuget.org/v3-flatcontainer/nuke.globaltool/index.json')
nuke_version=$(
	jq -er \
		'[.versions[] | select(contains("-") | not)] | last // error("no stable NUKE version found")' \
		<<<"$nuke_versions"
)
nuke_url="https://www.nuget.org/api/v2/package/nuke.globaltool/${nuke_version}"

eden_hash=$eden_current_hash
occt_hash=$occt_current_hash
keeper_hash=$keeper_current_hash
nuke_hash=$nuke_current_hash
changed=false

if [[ $eden_version != "$eden_current_version" ]]; then
	eden_hash=$(prefetch_hash "$eden_url")
	changed=true
fi
if [[ $occt_version != "$occt_current_version" ]]; then
	occt_hash=$(prefetch_hash "$occt_url")
	changed=true
fi
if [[ $keeper_version != "$keeper_current_version" ]]; then
	keeper_hash=$(prefetch_hash "$keeper_url")
	changed=true
fi
if [[ $nuke_version != "$nuke_current_version" ]]; then
	nuke_hash=$(prefetch_hash "$nuke_url")
	changed=true
fi

printf 'Eden:  %s -> %s\n' "$eden_current_version" "$eden_version"
printf 'OCCT:   %s -> %s\n' "$occt_current_version" "$occt_version"
printf 'Keeper: %s -> %s\n' "$keeper_current_version" "$keeper_version"
printf 'NUKE:   %s -> %s\n' "$nuke_current_version" "$nuke_version"

if [[ $changed == false ]]; then
	echo 'All local packages are up to date.'
	exit 0
fi

temporary_directory=$(mktemp -d)
trap 'rm -rf -- "$temporary_directory"' EXIT

cp -p -- "$EDEN_FILE" "$temporary_directory/eden.nix"
cp -p -- "$OCCT_FILE" "$temporary_directory/occt.nix"
cp -p -- "$KEEPER_FILE" "$temporary_directory/keeper.nix"
cp -p -- "$NUKE_FILE" "$temporary_directory/nuke.nix"

if [[ $eden_version != "$eden_current_version" ]]; then
	replace_once "$temporary_directory/eden.nix" \
		"version = \"${eden_current_version}\";" "version = \"${eden_version}\";"
	replace_once "$temporary_directory/eden.nix" \
		"hash = \"${eden_current_hash}\";" "hash = \"${eden_hash}\";"
fi
if [[ $occt_version != "$occt_current_version" ]]; then
	replace_once "$temporary_directory/occt.nix" \
		"version = \"${occt_current_version}\";" "version = \"${occt_version}\";"
	replace_once "$temporary_directory/occt.nix" \
		"hash = \"${occt_current_hash}\";" "hash = \"${occt_hash}\";"
fi
if [[ $keeper_version != "$keeper_current_version" ]]; then
	replace_once "$temporary_directory/keeper.nix" \
		"version = \"${keeper_current_version}\";" "version = \"${keeper_version}\";"
	replace_once "$temporary_directory/keeper.nix" \
		"hash = \"${keeper_current_hash}\";" "hash = \"${keeper_hash}\";"
fi
if [[ $nuke_version != "$nuke_current_version" ]]; then
	replace_once "$temporary_directory/nuke.nix" \
		"version = \"${nuke_current_version}\";" "version = \"${nuke_version}\";"
	replace_once "$temporary_directory/nuke.nix" \
		"nugetHash = \"${nuke_current_hash}\";" "nugetHash = \"${nuke_hash}\";"
fi

cp -- "$temporary_directory/eden.nix" "$EDEN_FILE"
cp -- "$temporary_directory/occt.nix" "$OCCT_FILE"
cp -- "$temporary_directory/keeper.nix" "$KEEPER_FILE"
cp -- "$temporary_directory/nuke.nix" "$NUKE_FILE"

echo 'Local package versions and hashes updated.'
