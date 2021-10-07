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
            (st.overrideAttrs (oldAttrs: rec {
                buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
                patches = [
                    (fetchpatch {
                        url = "https://st.suckless.org/patches/ligatures/0.8.4/st-ligatures-20210824-0.8.4.diff";
                        sha256 = "0mh7p3k5fx84n80m639agk838x2pp6628w8sca1xjgv64dfic574";
                    })
                    (fetchpatch {
                        url = "https://st.suckless.org/patches/undercurl/st-undercurl-0.8.4-20210822.diff";
                        sha256 = "091ixzrcqzh156zmrmma8wj6js770l8fdx467rkndy3x6hnbrxj3";
                    })
                ];
                configFile = writeText "config.def.h" (builtins.readFile ./config/st/config.h);
                postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
            }))
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
