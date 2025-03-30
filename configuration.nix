# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Yekaterinburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    	LC_ADDRESS = "ru_RU.UTF-8";
    	LC_IDENTIFICATION = "ru_RU.UTF-8";
    	LC_MEASUREMENT = "ru_RU.UTF-8";
    	LC_MONETARY = "ru_RU.UTF-8";
    	LC_NAME = "ru_RU.UTF-8";
    	LC_NUMERIC = "ru_RU.UTF-8";
    	LC_PAPER = "ru_RU.UTF-8";
    	LC_TELEPHONE = "ru_RU.UTF-8";
    	LC_TIME = "ru_RU.UTF-8";
  };
  services = {
	power-profiles-daemon = {
		enable = true;
	};
	xserver = {
		enable = true;
		xkb = {
			layout = "us";
			variant = "";
		};
		displayManager = {
			gdm.enable = false;
		};	
	};
	displayManager = {
		defaultSession = "hyprland";
		autoLogin = {
			enable = true;
			user = "aicanaro";
		};
	};
	pipewire = {
		enable = true;
		alsa = {
			enable = true;
			support32Bit = true;
		};
		pulse = {
			enable = true;
		};
	};
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
  	defaultUserShell = pkgs.zsh;
  	users.aicanaro = {
  		useDefaultShell = true;
		#defaultUserShell = pkgs.zsh;
    		isNormalUser = true;
    		description = "Aicanaro";
    		extraGroups = [ "networkmanager" "wheel" "input" ];
    		packages = with pkgs; [];
  	};
  };
   programs = {
	hyprland = {
        	enable = true;
	};
	xwayland = {
		enable = true;
	};
      	waybar = {
        	enable = true;
      	};
	yazi = {
		enable = true;
  		
	};
	hyprlock = {
		enable = true;
	};
	neovim = {
		enable = true;
		vimAlias = true;
	};
	zsh = {
		enable = true;
  		enableCompletion = true;
  		autosuggestions.enable = true;
  		syntaxHighlighting.enable = true;

  		shellAliases = {
    			ll = "ls -l";
    			update = "sudo nixos-rebuild switch";
  		};
		oh-my-zsh = {
    			enable = true;
    			plugins = [ "git" ];
    			theme = "xiong-chiamiov-plus";
  		};
	};
   };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   	wget
	obsidian
	git
	foot
    	waybar
    	hyprpaper
    	firefox
    	font-awesome
    	pavucontrol
    	fastfetch
    	xwayland
	xwayland-run
	xwayland-satellite
    	power-profiles-daemon
	telegram-desktop
	wl-clipboard
	yazi
	btop
	gtk4
	xdg-utils
	swaynotificationcenter
	neovim
	rofi-wayland
	hyprpicker
	hyprlock
	swaylock-effects
	zsh
	zsh-powerlevel10k
	nemo
	imv
	mpv
	audacious
	xdg-desktop-portal-hyprland
	brightnessctl
	grimblast
	gtk4-layer-shell
	wf-recorder
	wl-clip-persist
	libreoffice-qt6-fresh
	jdk17
	wayland
	wayland-protocols
	wineWowPackages.waylandFull
	jetbrains.idea-community
	rPackages.VFS
  ];
  fonts.packages = with pkgs; [
    	font-awesome
	nerdfonts
	noto-fonts
  	noto-fonts-cjk-sans
  	noto-fonts-emoji
  ];
  # hardware.pulseaudio.enable = true;
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
  system.stateVersion = "24.11"; # Did you read the comment?

}

