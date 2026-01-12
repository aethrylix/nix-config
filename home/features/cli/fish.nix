{
  config,
  lib,
  ...
}:

{
  options = {
    features = {
      cli = {
        fish = {
          enable = lib.mkEnableOption "Enable fish configuration";
        };
      };
    };
  };

  config = lib.mkIf config.features.cli.fish.enable {
    programs = {
      fish = {
        enable = true;

        shellAbbrs = {
          cd = "z";
          ls = "eza";
          grep = "rg";
          ps = "procs";
        };
      };
    };
  };
}
