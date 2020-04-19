{ config, pkgs, ... }:

{
  # Environment
  environment = {
    etc = {
      "sway/config" = {
        source = ./laptop-setup/sway/config;
      };
      "sway/wallpaper.png" = {
        source = ./laptop-setup/sway/wallpaper0.png;
      };
      "xdg/termite/config" = {
        source = ./laptop-setup/termite/config;
      };
    };
  };
}
