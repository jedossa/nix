{ pkgs, ... }:

{
  home.packages = with pkgs; [ zsh-completions thefuck autojump zoom-us ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "jedossa";
    userEmail = "jedossa@gmail.com";
    signing = {
      key = "jedossa@gmail.com";
      signByDefault = true;
    };
    ignores = [ ".directory" ];
  };
}
