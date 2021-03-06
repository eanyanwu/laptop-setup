{
    packageOverrides = pkgs: rec {

        user-packages = [
            sway-wm
            web-browser
            programming-tools
            document-viewer
            bells-and-whistles
        ];

        # All the needed to get sway working using my custom ocnfiguration
        sway-wm = pkgs.buildEnv {
            name = "sway-wm";
            paths = [
                pkgs.bemenu
                pkgs.fish
                pkgs.termite
                pkgs.sway
                pkgs.gnupg
                pkgs.pass
            ];
        };

        # Nice
        bells-and-whistles = pkgs.buildEnv {
            name = "bells-and-whistles";
            paths = [
                pkgs.exa
                pkgs.tree
            ];
        };

        # Coding-related software
        programming-tools = pkgs.buildEnv {
            name = "programming-tools";
            paths = [
                pkgs.vscodium
            ];
        };

        # Document viewer
        document-viewer = pkgs.buildEnv {
            name = "document-viewer";
            paths = [
                pkgs.evince
            ];
        };

        # Web broswer
        web-browser = pkgs.buildEnv {
            name = "web-browser";
            paths = [
                pkgs.firefox-wayland
            ];
        };

        # Backups
        backups = pkgs.buildEnv {
            name = "backups";
            paths = [
                pkgs.rsync
            ];
        };
    };
}
