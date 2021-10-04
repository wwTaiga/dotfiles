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
            lazygit
            ripgrep
            tmux
        ];
    };


    programs = {
        home-manager = {
            enable = true;
        };
    };

    xdg.configFile.nvim = {
        source = ./config/neovim;
        recursive = true;
    };
}
