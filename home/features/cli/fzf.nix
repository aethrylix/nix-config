{
  config,
  lib,
  ...
}:

{
  options = {
    features = {
      cli = {
        fzf = {
          enable = lib.mkEnableOption "Enable fuzzy finder";
        };
      };
    };
  };

  config = lib.mkIf config.features.cli.fzf.enable {
    programs = {
      fzf = {
        enable = true;

        enableFishIntegration = true;

        defaultOptions = [
          "--preview='bat -n {}'"
          "--bind 'ctrl-/:toggle-preview'"
        ];

        defaultCommand = "fd --type f --exclude .git --follow --hidden";
        changeDirWidgetCommand = "fd --type d --exclude .git --follow --hidden";
      };
    };
  };
}
