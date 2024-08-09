# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Hexagon Project for LISA by@TEWtew404
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=lisa
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
'; } # end properties

### AnyKernel install
# begin attributes
#attributes() {
#set_perm_recursive 0 0 755 644 $ramdisk/*;
#set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
#} # end attributes

# shell variables
block=boot;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh 

## AnyKernel boot install
dump_boot;

write_boot;
## end boot install

# migrate from /overlay to /overlay.d to enable SAR Magisk
#if [ -d $ramdisk/overlay ]; then
#  rm -rf $ramdisk/overlay;
#fi;


# shell variables
block=vendor_boot;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# reset for vendor_boot patching
reset_ak;


## AnyKernel vendor_boot install
split_boot; # skip unpack/repack ramdisk since we don't need vendor_ramdisk access

flash_boot;
## end vendor_boot install


