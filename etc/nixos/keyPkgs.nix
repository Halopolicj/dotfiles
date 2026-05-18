{ pkgs, ...}:


{
  environment.systemPackages = with pkgs; [
    		#Important stuff
    
    bluez 			#bluetooth
    brightnessctl		#self explenatory
    cliphist			#clipboard
    font-awesome		#default font
    hyprland			#WM
    hyprpaper			#Wallpapers
    hyprpolkitagent		#Sudo permissions for apps
    javaPackages.compiler.openjdk25	#java 25, also fuck you, you take too much space
    kdePackages.dolphin		#File manager
    killall			#INSIGNIFICANT FUCK
    kitty			#shell
    libnotify			#notif sender
    mako			#notif deamon
    mesa-demos			#some opengl related stuff
    neovim			#text editor
    pavucontrol       		#volume control
    rofi			#app launcher
    udiskie			#shows pendrives & etc. in file managers
    vlc				#media viewer
    wallust			#theme switcher
    wayland			#uninstalling this will brick the whole system
    xrandr			#resizing & rotating
    yazi			#in-terminal file manager
    ];
}
    

