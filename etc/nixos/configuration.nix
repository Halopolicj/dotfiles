# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ...}:
#let
  #stylix = pkgs.fetchFromGitHub {
    #owner = "nix-community";
    #repo = "stylix";
    #rev = "...";
    #sha256 = "...";
  #};
#in
#let
  #spicetify-nix = import (builtins.fetchTarball {
    #url = "https://github.com/Gerg-L/spicetify-nix/archive/master.tar.gz";
  #}) {  };
#in


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #spicetify-nix.nixosModules.spicetify  
      ./apps.nix
      ./default.nix
      ./keyPkgs.nix
      ./qolPkgs.nix
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Halopolicj"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  services.getty.autologinUser = "halo";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.xserver = {
   enable = true;
   videoDrivers = [ "nvidia" ];
  };

  services.displayManager.sddm.enable = true;

  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
  };

  environment.sessionVariables = {
   WLR_NO_HARDWARE_CURSORS = "1";
   NIXOS_OZONE_WL = "1";
  };

  hardware = {
      graphics.enable = true;
      nvidia.modesetting.enable = true;
      nvidia = {
          open = true;
	  prime = {
	      sync.enable = true;
              offload.enable = false;
 	      amdgpuBusId = "PCI:7@0:0:0";
  	      nvidiaBusId = "PCI:1@0:0:0";  
	  };
      }; 
 };

 programs.waybar.enable = true; 


 hardware.bluetooth.enable = true;
 hardware.bluetooth.powerOnBoot = true;
  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.halo = {
    isNormalUser = true;
    description = "Halopolicj";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  programs.steam.enable = true;
 
  #programs.wine.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  xdg.mime.defaultApplications = { 
    "application/pdf" = "firefox.desktop";
    "image/png" = "vlc.desktop";
    "audio/mp3" = "vlc.desktop";
    "video/mp4" = "vlc.desktop";
    "inode/directory" = "org.kde.dolphin.desktop";
  };

  services.udisks2.enable = true;
  
  stylix = {
    image = /home/halo/Wallpapers/lake2.png;
    enable = true;
    base16Scheme = {
      base00 = "ffffff";
      base01 = "ffffff";
      base02 = "ffffff";
      base03 = "ffffff";
      base04 = "ffffff";
      base05 = "ffffff";
      base06 = "ffffff";
      base07 = "ffffff";
      base08 = "ffffff"; 
      base09 = "ffffff";
      base0A = "ffffff";
      base0B = "ffffff";
      base0C = "ffffff";
      base0D = "ffffff";
      base0E = "ffffff";
      base0F = "ffffff";
    };
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
