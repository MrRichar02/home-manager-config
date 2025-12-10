{
  pkgs,
  lib,
  config,
  ...
}: let
  gitSyncObsidian = pkgs.writeScriptBin "git-sync-obsidian" ''
    #!/bin/sh

    VAULT_DIR="$HOME/Documents/obsidian-notes"
    cd $VAULT_DIR || exit 1
    git add .
    git commit -m "$(date '+%Y-%m-%d %H:%M:%S')" || exit 0
  '';
in {
  options.myServices.git-sync-obsidian.enable = lib.mkEnableOption "enables git sync obsidian service";
  config = lib.mkIf config.myServices.git-sync-obsidian.enable {
    home.packages = [gitSyncObsidian];

    systemd.user.services.git-sync-obsidian = {
      Unit = {
        Description = "Sync Obsidian Vault with GitHub";
        Wants = "git-sync-obsidian.timer";
      };
      Service = {
        ExecStart = "${gitSyncObsidian}/bin/git-sync-obsidian";
        Type = "simple";
      };
    };

    systemd.user.timers.git-sync-obsidian = {
      Unit.Description = "Run Git Sync for Obsidian Vault";
      Timer.OnCalendar = "*:0/15";
      Install.WantedBy = ["timers.target"];
    };
  };
}
