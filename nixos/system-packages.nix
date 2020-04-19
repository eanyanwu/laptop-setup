{ config, pkgs, services, ... }: 

{
  services.geoclue2.enable = true;
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.brightnessctl
  ];
}
