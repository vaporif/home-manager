{ pkgs, fzf-git-sh-package, lfcd-sh-package, ... }: {
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
    lua-language-server
  ];

  home.sessionVariables = {
    PATH = "/opt/homebrew/bin:$PATH";
  };

  programs = {
    ripgrep.enable = true;
    fd.enable = true;
    gh.enable = true;
    bat.enable = true;
    lazygit.enable = true;
    lf = {
      enable = true;

      keybindings = {
        "." = "set hidden!";
        e = "$$EDITOR $f";
        "f" = null;
        br = "cd ~/Repos/";
        be = "cd ~/Repos/eiger/";
        bm = "cd ~/.config/home-manager/";
        bw = "cd ~/Repos/giza-axelar-starknet/";
      };

      # NOTE: escaping scripts is not cool so just readFile
      extraConfig = builtins.readFile ./lfrc;
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
        t = "lfcd";
        lf = "lfcd";
        lg = "lazygit";
        ls = "eza -a";
        cat = "bat";
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
        source ${lfcd-sh-package}/bin/lfcd.sh
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
  home.file.".envrc".text = ''
    use flake github:vaporif/devshell
  '';

  xdg.configFile.nvim.source = ./nvim;
  xdg.configFile."lf/icons".source = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/gokcehan/lf/master/etc/icons.example";
    sha256 = "12cwy6kfa2wj7nzffaxn5bka21yjqa5sx38nzdhyg1dq0c6jnjkk";
  };
  xdg.configFile."zellij/config.kdl".text = "${builtins.readFile ./zellij/config.kdl}";
}
