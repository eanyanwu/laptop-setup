{ config, pkgs, ... }:

{
  # Network Manager
  networking.networkmanager.enable = true;


  # Hostname
  networking.hostName = "cow-0";
}
