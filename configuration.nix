# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.cleanTmpDir = true;

  networking.hostName = "yagami";
  networking.networkmanager.enable = true;
  networking.networkmanager.packages = [ pkgs.networkmanagerapplet ];
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" ];
  
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.useDHCP = false;
  # networking.interfaces.enp2s0.useDHCP = true;
  # networking.interfaces.wlo1.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = null;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    coreutils dcfldd wget curl gnupg git htop emacs lsof vscode vlc bubblewrap
    openssh xz killall mkpasswd nox xclip ark file dnsutils protobuf steam-run
    openvpn nix-prefetch-git kgpg nix-index terminator openjdk8 zip unzip slack
    home-manager tmux tree arandr gitAndTools.gitflow docker-compose scala dotty
    sbt ammonite jetbrains.idea-community bloop meld google-chrome
    libreoffice okular spectacle plasma-browser-integration kdeplasma-addons
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  sound.mediaKeys.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;    
  };
  hardware.bluetooth.enable = true;
  hardware.enableAllFirmware = true;
  hardware.openrazer.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "qwerty";

  powerManagement.enable = true;

  fonts = {
    fontconfig.enable = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      noto-fonts noto-fonts-cjk fira fira-code fira-mono fira-code-symbols
    ];
  };

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # zsh
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "sudo" "git-flow" "tmux" "git-prompt" ];
    theme = "bira";
  };

  # docker
  virtualisation.docker.enable = true;

  # Weechat
  services.weechat.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.yagami = {
    isNormalUser = true;
    home = "/home/yagami";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "docker" "plugdev" ]; # Enable ‘sudo’ for the user.
  };

  system.autoUpgrade.enable = true;
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 60d";
  nix.autoOptimiseStore = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
