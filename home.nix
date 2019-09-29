{ pkgs, ... }:

{
  home.packages = with pkgs; [ vscode zsh-completions thefuck];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "jedossa";
    userEmail = "jefersonossa@s4n.co";
    signing = {
      key = "jefersonossa@s4n.co";
      signByDefault = true;
    };
    ignores = [ ".directory" ];
  };
}
