{ config, pkgs, ... }:

{
    home = {
        username = "taiga";
        homeDirectory = "/home/taiga";
        stateVersion = "21.11";
        sessionVariables = {
            TERMINFO_DIRS = "${pkgs.kitty.terminfo.outPath}/share/terminfo";
        };
        packages = with pkgs; [
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
        ];

        file = {
            ".zshrc" = {
                source = ./config/zsh;
            };
        };
    };

    programs = {
        git = {
            enable = true;
            userName = "Taiga";
            userEmail = "qqtaiga@gmail.com";
        };
        home-manager = {
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
