# enlarge the 3rd partition (this example uses mmcblk0)
growpart /dev/mmcblk0 3

# grow the volume to take up the rest of the disk
resize2fs /dev/mmcblk0p3
# resize root partition for the armhfp server image (which uses xfs)
xfs_growfs -d /

# enlarge the 3rd partition (this example uses mmcblk0)
growpart /dev/mmcblk0 3
# resize the physical volume
pvresize /dev/mmcblk0p3
# extend the root filesystem to take up the space just added to the volume that it is in
lvextend -l +100%FREE /dev/fedora/root
# resize root partition for the server image (which uses xfs)
xfs_growfs -d /
