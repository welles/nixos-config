{
  user,
  userDescription,
  passwordConfig,
  extraGroups,
  ...
}: {
  users.users.${user} =
    {
      isNormalUser = true;
      description = userDescription;
      inherit extraGroups;
    }
    // passwordConfig;
}
