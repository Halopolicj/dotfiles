{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
		#Some usefull apps to have
    
  fastfetch			#shows device information
  flameshot			#screenshot tool
  git				#do i even need to say it?
  grim				#screenshot tool from terminal, also recomended for flameshot with wayland compatibility
  nvitop			#some info for nvidia gpus
  obs-studio			#screen recording
  p7zip				#7zip in terminal
  playerctl			#required for controling stuff with bluetooth headphones' buttons
  ];
} 
