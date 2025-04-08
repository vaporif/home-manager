{ pkgs, fzf-git-sh-package, yamb-yazi, blink-cmp-words, ... }: {
  programs.home-manager.enable = true;


  home.packages = with pkgs; [
    nerd-fonts.hack
    coreutils
    wget
    delta
    tldr
    bottom
    hyperfine
    pango
    wordnet
  ];

  home.sessionVariables = {
    PATH = "/opt/homebrew/bin:$PATH";
    WORDNET_PATH = "${pkgs.wordnet}";
  };

  programs = {
    ripgrep.enable = true;
    fd.enable = true;
    gh.enable = true;
    lazygit.enable = true;
    bat = {
      enable = true;
    };
    yazi = {
      enable = true;
      enableZshIntegration = true;
    };

    kitty = {
      enable = true;
      font = {
        name = "Hack Nerd Font Mono";
        size = 14;
      };
      themeFile = "everforest_dark_soft";
      settings = {
        scrollback_lines = 20000;
        enable_audio_bell = false;
        cursor_trail = 2;
        confirm_os_window_close = 0;
        cursor_trail_start_threshold = 4;
        cursor_trail_decay = "0.05 0.2";
      };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      stdlib = builtins.readFile ./direnvrc;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ghc = "gh pr create -a @me";
        ghm = "gh pr merge -d";
        ghl = "gh pr list";
        t = "yy";
        lg = "lazygit";
        ls = "eza -a";
        cat = "bat";
        e = "nvim";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "rust" ];
        theme = "robbyrussell";
      };
      initExtra = ''
        export PATH="/opt/homebrew/bin:$PATH"
        ulimit -Sn 4096
        ulimit -Sl unlimited
        source ${fzf-git-sh-package}/bin/fzf-git.sh
      '';
    };

    git = {
      enable = true;
      userName = "Dmytro Onypko";
      userEmail = "vaporif@gmail.com";
      aliases = {
        co = "checkout";
        cob = "checkout -b";
        discard = "reset HEAD --hard";
        fp = "fetch --all --prune";
      };
      signing = {
        key = "68EFF4350C9C15CD";
        signByDefault = true;
        format = "openpgp";
      };

      extraConfig = {
        pull.ff = "only";
        push.autoSetupRemote = true;
        gui.encoding = "utf-8";
        merge.conflictstyle = "diff3";
        init.defaultBranch = "main";
        rebase.autosquash = true;
        rebase.autostash = true;
        commit.verbose = true;
        diff.colorMoved = true;
        diff.algorithm = "histogram";
        feature.experimental = true;
        help.autocorrect = "prompt";
        branch.sort = "committerdate";
      };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    neovim = {
      viAlias = true;
      enable = true;
      extraPackages = with pkgs; [
        lua51Packages.luarocks
        lua51Packages.lua
        lua-language-server
        stylua
      ];
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    zellij = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home.file.".local/share/blink-cmp-dict/words.txt".source = "${blink-cmp-words}/words.txt";
  xdg.configFile."yazi/init.lua".text = "${builtins.readFile ./yazi/init.lua}";
  xdg.configFile."yazi/keymap.toml".text = "${builtins.readFile ./yazi/keymap.toml}";
  xdg.configFile."yazi/theme.toml".text = "${builtins.readFile ./yazi/theme.toml}";

  home.file.".config/yazi/plugins/yamb.yazi/" = {
    source = yamb-yazi;
    recursive = true;
  };

  home.file.".envrc".text = ''
    use flake github:vaporif/devshell
  '';

  xdg.configFile.nvim.source = ./nvim;
  xdg.configFile."zellij/config.kdl".text = "${builtins.readFile ./zellij/config.kdl}";

  xdg.configFile."bat/config".text = ''
    --style="plain"
  '';
}
