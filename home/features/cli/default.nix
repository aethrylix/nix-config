{ pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./fzf.nix
    ./fastfetch.nix
  ];

  programs = {
    zoxide = {
      enable = true;

      enableFishIntegration = true;
    };

    eza = {
      enable = true;

      enableFishIntegration = true;
      enableBashIntegration = true;

      extraOptions = [
        "-l"
        "--icons"
        "--git"
        "-a"
      ];
    };

    bat = {
      enable = true;
    };
  };

  home = {
    packages = with pkgs; [
      coreutils
      fd
      btop
      procs
      ripgrep
      tldr
      zip
    ];
  };
}
