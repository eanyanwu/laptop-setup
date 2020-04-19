{ config, pkgs, ... }:

{
  fonts.enableDefaultFonts = true;

  fonts.fonts = [
    pkgs.iosevka
    pkgs.fira-code
    pkgs.fira-mono
  ];
}
