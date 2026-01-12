{
  config,
  lib,
  pkgs,
  ...
}:

{
  home = {
    username = lib.mkDefault "shane";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";

    packages = with pkgs; [
      vim
    ];

    file = { };

    sessionVariables = { };

    stateVersion = "25.11";
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };
}
