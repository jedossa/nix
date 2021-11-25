{ pkgs, ... }:

{
  home.packages = with pkgs; [ zsh-completions thefuck autojump sbt coursier ammonite jetbrains.idea-community google-chrome vscode rustup ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "jedossa";
    userEmail = "jedossa@gmail.com";
    signing = {
      key = "jedossa@gmail.com";
      signByDefault = true;
    };
    ignores = [ ".directoy" ];
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
