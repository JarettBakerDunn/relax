#!/bin/bash

set -e
self=$(basename $0)
trap 'echo $self: Some errors occurred. Exiting.; exit' ERR

if (test $# -lt "3"); then
	echo "usage: $self item1 item2 item3"
	echo "computes the sum item3 = item1 + item2"
	exit 1
fi

ITEMA=$1
ITEMB=$2
ITEMC=$3

echo $self": Using directory "$(dirname $ITEMA)

GRDFILEA1=$ITEMA-east.grd
GRDFILEA2=$ITEMA-north.grd
GRDFILEA3=$ITEMA-up.grd

GRDFILEB1=$ITEMB-east.grd
GRDFILEB2=$ITEMB-north.grd
GRDFILEB3=$ITEMB-up.grd

GRDFILEC1=$ITEMC-east.grd
GRDFILEC2=$ITEMC-north.grd
GRDFILEC3=$ITEMC-up.grd

if [ "$ITEMB" == "0" ]; then
	echo $self": copying to "$(dirname $ITEMC)", files "$(basename $GRDFILEC1), $(basename $GRDFILEC2), $(basename $GRDFILEC3)
	cp $GRDFILEA1 $GRDFILEC1
	cp $GRDFILEA2 $GRDFILEC2
	cp $GRDFILEA3 $GRDFILEC3
else
	echo $self": copying to files $(basename $GRDFILEC1), $(basename $GRDFILEC2), $(basename $GRDFILEC3)"

	gmt grdmath $GRDFILEA1 $GRDFILEB1 ADD = $GRDFILEC1
	gmt grdmath $GRDFILEA2 $GRDFILEB2 ADD = $GRDFILEC2
	gmt grdmath $GRDFILEA3 $GRDFILEB3 ADD = $GRDFILEC3
fi




