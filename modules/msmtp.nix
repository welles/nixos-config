# Outbound mail relay for notifications, available as `sendmail`. The SMTP
# account comes from `msmtpAccount` (host, user, from); its password is the
# sops secret `msmtp-password` in the host's secrets.yaml.
{
  config,
  msmtpAccount,
  ...
}: {
  programs.msmtp = {
    enable = true;
    setSendmail = true;
    defaults = {
      port = 465;
      tls = true;
      tls_starttls = false;
      auth = true;
    };
    accounts.default =
      msmtpAccount
      // {
        passwordeval = "cat ${config.sops.secrets."msmtp-password".path}";
      };
  };

  sops.secrets."msmtp-password".mode = "0444";
}
