{ config, pkgs, ... }:
{
    systemd.mounts = [
        {
            what = "/dev/sdb1";
            where = "/mount"; 
            unitConfig = {
                Description = "Usb Mounting";
                Options = "users";
            };
        }
    ];

    systemd.automounts = [
        {
            where = "/mount";
            wantedBy = [ "multi-user.target" ];
            unitConfig = {
                Description = "Usb Auto-mounting";
            };
        }
    ];

}
