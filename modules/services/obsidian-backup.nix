{lib, config, pkgs, ...}:
let
    gitSyncObsidian = pkgs.writeScriptBin "git-sync-obsidian" ''
        #!/bin/sh

        VAULT_DIR="$HOME/Documents/obsidian-notes"
    cd $VAULT_DIR || exit 1

    git add .

        git commit -m "$(date '+%Y-%m-%d %H:%M:%S')" || exit 0
    '';
in
    {
    options.myServices.obsidian-backup.enable = lib.mkEnableOption "enables obsidian-backup service";
    config = lib.mkIf config.myServices.obsidian-backup.enable {
        home.packages = [ gitSyncObsidian ];
        systemd.user.services.git-sync-obsidian = {
            Unit = {
                Description = "Sync Obsidian vault with git";
                Wants = "git-sync-obsidian.timer";
            };
            service = {
                ExcecStart = "${gitSyncObsidian}/bin/git-sync-obsidian";
                Type = "Simple";
            };
        };

        systemd.user.timers.git-sync-obsidian = {
            Unit.Description = "Runs Git sync for obsidian vault";
            Timer.OnCalendar = "*:0/15";
            Install.WantedBty = [ "timers.target" ];
        };
    };
}

