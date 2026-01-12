{
  imports = [
    ./home.nix
    ../common
    ../features/cli
  ];

  features = {
    cli = {
      fish = {
        enable = true;
      };

      fzf = {
        enable = true;
      };

      fastfetch = {
        enable = true;
      };
    };
  };
}
