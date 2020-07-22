#!/bin/bash
CURDIR=`pwd`
OVERLAYDIR="/opt/retropie/emulators/retroarch/overlays"
SRCDIR="./overlays"
echo "************************************************************************"
echo ""
echo "This shell script will install overlays from overlays/ to RetroPie"
echo "overlay directory $OVERLAYDIR."
echo " "
echo "NOTE: will not overwrite existing files. Tested on RetroPie 4.6."
echo " "
read -s -n 1 -p "Press any key to continue (or CTRL+C to abort) . . ."
echo " "
echo " "

if [ ! -d "$OVERLAYDIR" ] ; then    
    echo "ERROR: directory $OVERLAYDIR does not exist. Is this a RetroPie system?"
    exit 1
fi
if [ ! -d "$SRCDIR" ] ; then
    echo "ERROR: source $SRCDIR directory does not exist. Aborting."
    exit 1
fi

# Copy, show what is copied, don't overwrite
sudo cp -vrn $SRCDIR/* $OVERLAYDIR
RETVAL=$?
## FIXME: owner/permissions?

###

echo " "
echo " "
echo "************************************************************************"
if [ $RETVAL -eq 0 ] ; then
    echo "Overlays copied to destination"
else
    echo "Overlays copied. Some errors were detected."
fi    

