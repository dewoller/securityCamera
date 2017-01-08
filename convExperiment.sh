#!/bin/bash
set -x 
set -v
#DEVICE=$(hostname)
#DEVICE=${DEVICE:7}
EXPERIMENT=$1
export CONV_SAVE_BASE=/root/save/conv
shift
for i in 032  064  096 128  ; do 
  export DEEP_SAVE_PATH=$CONV_SAVE_BASE/$EXPERIMENT/$i
  size=$(echo $i | sed 's/^0//')
  th convolutionneuralnetwork.lua \
	--dataset securityCamera \
	--imageSize $size \
	--cuda \
	--useDevice 1 $@
  LOGFILE=$(find $DEEP_SAVE_PATH -iname 'metadata.dat' | head -1)
  LOGDIR=$(dirname "$LOGFILE")
  IMAGELABEL=$(echo $LOGDIR | sed 's/[\/.:]/_/g;s/^_*//') 
  find $LOGDIR -iname 'metadata*.dat' | while read i; do D=$(dirname $i) ;th report2csv.lua --dir $D; done >>convResults.csv
done
