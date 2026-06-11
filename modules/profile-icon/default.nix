_: {
  system.activationScripts.set-profile-icon.text = ''
    mkdir -p /var/lib/AccountsService/icons
    cp ${./floating.png} /var/lib/AccountsService/icons/nico
  '';
}
