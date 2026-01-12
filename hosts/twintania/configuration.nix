{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./disko-config.nix
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };

      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  networking = {
    hostName = "twintania";

    firewall = {
      enable = true;

      allowedTCPPorts = [ 22 ];
    };
  };

  time = {
    timeZone = "Europe/London";
  };

  environment = {
    systemPackages = with pkgs; [
      git
    ];
  };

  services = {
    openssh = {
      enable = true;

      settings = {
        PermitRootLogin = "no";
      };

      allowSFTP = true;
    };
  };

  programs = {
    fish = {
      enable = true;
    };
  };

  system.stateVersion = "25.05";
}
