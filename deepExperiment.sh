#!/bin/bash
DEVICE=$(hostname)
DEVICE=${DEVICE:8}
EXPERIMENT=$1
export DEEP_SAVE_BASE=/root/save/deep/
shift
for i in 032  064  096 128  160  192  256  ; do 
#for i in 128  160  192  256  32  64  96; do 
  export DEEP_SAVE_PATH=$DEEP_SAVE_BASE/$EXPERIMENT/$i
  size=$(echo $i | sed 's/^0//')
  th deepinception.lua \
	--dataset securityCamera \
	--imageSize $size \
	--cuda \
	--progress \
	--useDevice $DEVICE $@
  LOGFILE=$(find $DEEP_SAVE_PATH -iname 'metadata.dat' | head -1)
  LOGDIR=$(dirname "$LOGFILE")
  IMAGELABEL=$(echo $LOGDIR | sed 's/[\/.:]/_/g;s/^_*//') 
  th plotDir.lua --dir $LOGDIR --title "$IMAGELABEL" --outFile "$DEEP_SAVE_BASE/png/$IMAGELABEL.png"
  find $LOGDIR -iname 'metadata*.dat' | while read i; do D=$(dirname $i) ;th report2csv.lua --dir $D; done >>deep.csv
done
