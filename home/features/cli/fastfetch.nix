{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    features = {
      cli = {
        fastfetch = {
          enable = lib.mkEnableOption "Enable fastfetch";
        };
      };
    };
  };

  config = lib.mkIf config.features.cli.fastfetch.enable {
    home = {
      packages = with pkgs; [
        fastfetch
      ];
    };
  };
}
