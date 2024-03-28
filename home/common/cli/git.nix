{pkgs, ...}: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Mohamed Tarek";
    userEmail = "mohamed96tarek@hotmail.com";
    delta = {
      enable = true;
      package = pkgs.delta;
      options = {
        navigate = true;
        light = false;
        side-by-side = false;
        line-numbers = true;
        syntax-theme = "gruvbox-dark";
      };
    };
    extraConfig = {
      credential.helper = "cache";
      core = {
        editor = "emacsclient -c -a 'emacs'";
        # pager = "delta";
      };
      interactive.diffFilter = "delta --color-only";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      github.user = "xeros-and-ones";
    };
  };
}
