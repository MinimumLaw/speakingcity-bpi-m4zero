# SpecTechPribor-BuildRoot for BPI-M4ZERO

SpecTechPribor buildroot template for BananaPI M4 Zero board. HowTo build and check.

## Prerequirements:

  You need Linux based distro (Debian, Ubuntu) with installed developer packages

## Prepare:

Make working directory
   
    mkdir progect

Change working direcctory as current

    cd project

Clone buildroot git tree from officaial source

    git clone https://git.buildroot.net/buildroot

Clone this repositary from github

    git clone https://github.com/MinimumLaw/speakingcity-bpi-m4zero.git

Change work directory to speakingcity-bpi-m4zero

    cd speakingcity-bpi-m4zero

Run build process

    ./build-bpi-m4zero.sh

Just wait for competion. After success build process you have output sdcard.img 
into output/bpi-m4zero/images directory. This image may be writen to sdcard and eMMC
storage on module

    ls output/bpi-m4zero/images    
    ... sdcard.img  ...

## Write to sdcard 

You may write then to sd-card with diskdup utility

    sudo dd if=output/bpi-m4zero/images/sdcard.img of=/dev/flash bs=1M status=progress conv=sync

/dev/flash in this example is cardreader device name (/dev/sde for example). Check new devices with syslog or another system utility.

For console access use username "root" and password "stp", you alse can use
this accont via preconfigured ssh connection.

## Write to eMMC device

You need technology SDcard and system console access to write image into eMMC storage.

1. Prepare SDcard ad described bolow
2. Place SDcard into slot, connect system conso;e to debug uart or BananaPI M4 Zero board (115200,8,n,1)
3. Power up and send CTRL-C to system console until U-Boot command promt not received

This time we have bootloader console and prepared.

### Write with usb masstorage mode

In U-Boot console make command

    ums 0 mmc 1

Connect Type-C cable to OTG slot on board and PC with linux. You may write then to eMMC with diskdup utility

    sudo dd if=output/bpi-m4zero/images/sdcard.img of=/dev/flash bs=1M status=progress conv=sync

/dev/flash in this example is board device name (/dev/sdf for example). Check new devices with syslog or another system utility.

flashing done

### Write with android fastboot utility

In U-Boot console make command

    fastboot usb 0

Connect Type-C cable to OTG slot on board and PC with linux. You may write then to eMMC with diskdup utility

    fastboot flash 1:0 output/bpi-m4zero/images/sdcard.img

flashing done

## Add corporate package to this template

Example of private buildroot packages you can see in package/* directory or in buildroot
documentation https://buildroot.org/downloads/manual/manual.html#adding-packages


## Additional comments

This exaple use root filesystem _COMPLETE_ in RAM. Buildroot make rootfs.cpio.gz (with complete root fiesystem) and place them on first (vfat) partition of sdcard or eMMC. If we need traditional layout, we must fix buildroot config and image layout in board/stp/bananapi-m4zero/genimage.cfg configuration file.
