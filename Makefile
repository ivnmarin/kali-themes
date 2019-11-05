SUBDIRS=emblems kali-logos

build:
	$(foreach SUBDIR,$(SUBDIRS),$(MAKE) -C $(SUBDIR) build &&) true
	# We populate desktop-base subdirectory with stuff to be installed into
	# kali-desktop-base in the file structure expected by desktop-base
	rm -rf desktop-base
	mkdir -p desktop-base/kali-theme/grub
	cp Grub-Background/kali-2019/*.png Grub-Background/kali-2019/*.sh desktop-base/kali-theme/grub/
	cp -a LockScreen/kali desktop-base/kali-theme/lockscreen
	cp -a Wallpapers/kali desktop-base/kali-theme/wallpaper
	cp -a LoginScreen/kali desktop-base/kali-theme/login
	ln -s /usr/share/plymouth/themes/kali desktop-base/kali-theme/plymouth

clean:
	$(foreach SUBDIR,$(SUBDIRS),$(MAKE) -C $(SUBDIR) clean &&) true
	rm -rf desktop-base/*

install:
	# We use debhelper to install most files, but some subdirectories
	# install files by themselves
	$(foreach SUBDIR,$(SUBDIRS),$(MAKE) -C $(SUBDIR) install &&) true

include Makefile.inc
