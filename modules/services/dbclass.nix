{ config, pkgs, ... }:

let
  zoomUrl = "https://udearroba.zoom.us/j/99971686698";
  zenBrowser = "${pkgs.inputs.zen-browser.packages.${pkgs.system}.default}/bin/zen";
in
{
  systemd.user.services.open-db-zoom-class = {
    Unit = {
      Description = "Abrir Zoom para la clase con Zen Browser";
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${zenBrowser} --new-tab '${zoomUrl}'";
    };
  };

  systemd.user.timers.open-zoom-class = {
    Unit = {
      Description = "Timer para abrir Zoom a las 12 PM usando Zen Browser";
    };
    Timer = {
      OnCalendar = "Mon,Wed 12:00";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}

