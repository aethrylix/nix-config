{
  config,
  pkgs,
  inputs,
  ...
}:

{
  users = {
    users = {
      shane = {
        isNormalUser = true;
        initialHashedPassword = "$y$j9T$U9vRkp0aTIZezMCnqREPm1$5znfrukdtR5Dpt2.t20RGXJxccwaped9kryHithA625";

        extraGroups = [
          "networkmanager"
          "wheel"
          "flatpak"
          "audio"
          "video"
          "input"
        ];

        packages = [
          inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };
    };
  };

  home-manager = {
    users = {
      shane = import ../../../home/shane/${config.networking.hostName}.nix;
    };
  };
}
