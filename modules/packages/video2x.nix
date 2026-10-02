{pkgs, ...}: {
  environment.systemPackages = [
    # GCC 16 defaults to C++20, where `path::u8string()` returns `std::u8string`,
    # which fmt/spdlog refuse to format. Restore the pre-C++20 `char` behaviour.
    (pkgs.video2x.overrideAttrs (old: {
      env =
        (old.env or {})
        // {
          NIX_CFLAGS_COMPILE = toString [(old.env.NIX_CFLAGS_COMPILE or "") "-fno-char8_t"];
        };
    }))
  ];
}
