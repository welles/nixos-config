# Web-based system monitoring dashboard
_: {
  services.glances = {
    enable = true;
    extraArgs = ["--webserver" "--disable-check-update"];
  };
}
