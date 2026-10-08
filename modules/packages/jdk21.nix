# JDK 21 alongside the default JDK (e.g. jdk25.nix). Low priority so the
# default JDK keeps owning `java` on PATH; use JAVA_21_HOME to select it.
{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = [(lib.lowPrio pkgs.jdk21)];
  environment.variables.JAVA_21_HOME = pkgs.jdk21.home;
}
