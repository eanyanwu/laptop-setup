# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    time.timeZone = "America/New_York";

    imports =
    [ 
      ./hardware-configuration.nix
      ./system-packages.nix
      ./systemd.nix
      ./environment.nix
      ./networking.nix
      ./fonts.nix
    ];

# Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.cleanTmpDir = true;

# User Management
    security.sudo.wheelNeedsPassword = false;

    users.mutableUsers = false;
    users.motd = "Welcome, Traveler";
    users.users = {
    root = {
      createHome = false;
      password = " ";
    };
    user0 = {
      isNormalUser = true;
      extraGroups = [ "wheel" "video" ];
      password = "cow-0";
    };
    };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
    system.stateVersion = "19.09"; # Did you read the comment?
}

