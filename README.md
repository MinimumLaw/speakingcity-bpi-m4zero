# SpecTechProbot-Buildroot

SpecTechProbor buildroot template

HowTo build and check:

Prerequirements:
  You need Linux based distro (Debian, Ubuntu) with installed developer packages

Prepare:
1. Make working directory
 $ mkdir progect
2. Change working direcctory as current
 $ cd project
3. Clone buildroot git tree from officaial source
 $ git clone https://git.buildroot.net/buildroot
4. Clone this repositary from github
 $ git clone https://github.com/MinimumLaw/speakingcity-bpi-m4zero.git
5. Change work directory to gvardman
 $ cd speakingcity-bpi-m4zero
6. Run build process
 $ ./build-bpi-m4zero.sh
7. Just wait for competion...
8. You have output sdcard.img into output/bpi-m4zero/images directory
 $ ls output/orangepi3_lts/images
 ... sdcard.img  ...
 $
9. You may write then to sd-card with diskdup utility
 $ sudo dd if=output/bpi-m4zero/images/sdcard.img of=/dev/flash bs=1M status=progress conv=sync
   For console access use username "root" and password "stp", you alse can use
   this accont via preconfigured ssh connection.
10. Example of private buildroot packages you can see in package/* directory or in buildroot
    documentation https://buildroot.org/downloads/manual/manual.html#adding-packages

    For Dmitry:
    Example for package, builded with Scons build system in buildroot is gpsd daemon:
    https://git.buildroot.net/buildroot/tree/package/gpsd/gpsd.mk
    You can use them as template for you personal private package
11. Have fun! Don't worry, be happy!

