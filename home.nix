{ config, pkgs, ... }:

{
    fonts.fontconfig.enable = true;

    home = {
        username = "taiga";
        homeDirectory = "/home/taiga";
        stateVersion = "21.11";
        sessionVariables = {
            TERMINFO_DIRS = "${pkgs.kitty.terminfo.outPath}/share/terminfo";
        };
        packages = with pkgs; [
            bat
            cargo
            fzf
            gcc
            gnumake
            go
            neovim
            lazygit
            ripgrep
            rustc
            tmux

            nodePackages.npm

            (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
        ];

        file = {
            ".zshrc" = {
                source = ./config/zsh/.zshrc;
            };
        };
    };

    programs = {
        bat = {
            enable = true;
            config = {
                theme = "GitHub";
            };
        };
        git = {
            enable = true;
            userName = "Taiga";
            userEmail = "qqtaiga@gmail.com";
            extraConfig = {
                core = {
                  editor = "nvim";
                };
                color = {
                  ui = true;
                };
            };
        };
        home-manager = {
            enable = true;
        };
        zsh = {
            enable = true;
        };
    };

    xdg = {
        configFile = {
            nvim = {
                source = ./config/neovim;
                recursive = true;
            };
            tmux = {
                source = ./config/tmux;
                recursive = true;
            };
        };
    };

}
