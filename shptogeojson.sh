#!/bin/bash
# this script will export all .shp files in a directory to .geojson files in a specified subdirectory 
# ************************************************************************************************************

NEWDIR=${2:-"$1/geojson/"}

exit