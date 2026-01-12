{
  lib,
  inputs,
  outputs,
  pkgs,
  ...
}:

{
  imports = [
    ./users

    ./i18n.nix
    ./keymap.nix
    ./netmgr.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      trusted-users = [
        "root"
        "shane"
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };

    optimise.automatic = true;

    registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
      (lib.filterAttrs (_: lib.isType "flake")) inputs
    );

    nixPath = [
      "/etc/nix/path"
    ];
  };

  users = {
    defaultUserShell = pkgs.fish;
  };
}
