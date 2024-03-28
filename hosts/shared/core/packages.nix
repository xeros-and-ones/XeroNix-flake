{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      # network tools
      wget
      # editors
      neovim
      vscode
      kate
      (emacs.override {
        withNativeCompilation = true;
        withTreeSitter = true;
        withGTK3 = true;
      })

      # browsers
      (google-chrome.override {
        commandLineArgs =
          ""
          + " --enable-zero-copy" # dont enable in about:flags
          + " --ignore-gpu-blocklist" # dont enable in about:flags
          + " --enable-raw-draw"
          + " --canvas-oop-rasterization"
          ############ disable Features
          + " --disable-features="
          + "UseChromeOSDirectVideoDecoder,"
          ############ enable Features
          + " --enable-features="
          + "VaapiVideoEncoder,"
          + "VaapiVideoDecoder,"
          + "CanvasOopRasterization,"
          + "Vulkan,"
          + " --use-vulkan";
      })

      # terminal $ mux
      kitty
      zellij
      tmux

      # cli tools
      fd
      eza
      bat
      ripgrep
      lazygit
      erdtree

      # system tools
      pciutils
      lshw
      coreutils
      glxinfo
      stow
      libva-utils
      vdpauinfo
      intel-gpu-tools

      # clipboard tools
      xclip
      wl-clipboard
      qbittorrent-qt5

      ###### dev tools
      #-- c/c++
      cmake
      cmake-language-server
      gnumake
      checkmake
      # c/c++ compiler, required by nvim-treesitter!
      gcc
      # c/c++ tools with clang-tools, the unwrapped version won't
      # add alias like `cc` and `c++`, so that it won't conflict with gcc
      llvmPackages.clang-unwrapped
      lldb
      gdb

      # zig
      zig
      zls

      # rust
      cargo
      rustc
      rustfmt
      rust-analyzer

      #-- javascript/typescript --#
      nodePackages.nodejs
      nodePackages.typescript
      nodePackages.typescript-language-server
      # HTML/CSS/JSON/ESLint language servers extracted from vscode
      nodePackages.vscode-langservers-extracted
      nodePackages."@tailwindcss/language-server"

      # go
      go
      gore
      gotests
      gotools
      gomodifytags
      iferr # generate error handling code for go
      impl # generate function implementation for go
      gopls # go language server
      delve # go debugger

      #-- lua
      stylua
      lua-language-server

      # other
      taplo # TOML language server / formatter / validator
      nodePackages.yaml-language-server
      tree-sitter # common language parser/highlighter
      nodePackages.prettier # common code formatter
      marksman # language server for markdown

      # nix tools
      nil
      alejandra
      nixfmt

      #-- bash
      nodePackages.bash-language-server
      shellcheck
      shfmt

      #-- python
      nodePackages.pyright # python language server
      poetry
      (python311.withPackages (ps:
        with ps; [
          python-lsp-server
          python-lsp-ruff
          black # python formatter
          isort

          colorama
          ipython
          pandas
          requests
          pyquery
          pyyaml

          ## emacs's lsp-bridge dependenciesge
          epc
          orjson
          sexpdata
          six
          setuptools
          paramiko
          rapidfuzz
        ]))
    ];
  };
}
