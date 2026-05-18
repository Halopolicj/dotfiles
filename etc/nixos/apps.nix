{ config, lib, pkgs, ... }:

#let
  #spicetify-nix = import (builtins.fetchTarball {
    #url = "https://github.com/Gerg-L/spicetify-nix/archive/master.tar.gz";
   # sha256 = "1jagxm9rfdbzq93h1mnrai28nd1k1f85r7ps4wwyycgk56sp5ny1";
  #}) {  };
#in

{
  #imports = [
   # spicetify-nix.nixosModules.spicetify
  #];

  #programs.spicetify = {
   # enable = true;
    #theme = spicetify-nix.packages.themes.hazy;
    #enabledCustomApps = with spicetify-nix.packages.apps; [
     # marketplace
    #];
  #};

  environment.systemPackages = with pkgs; [
    aseprite			#
    discord			#
    openutau			#
    prismlauncher		#
    protontricks		#	
    steam			#
    vscodium			#
  ];
}
