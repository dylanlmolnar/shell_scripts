echo 'starting script'

#create a mosaic vrt from all tifs in folder
gdalbuildvrt newvrt.vrt *.tif
echo 'vrt complete, now rendering as rgb and compressing'

#convert the vrt to show the visible bands 3,2,1 for 4-band ps
#use deflate compression
gdal_translate -dstnodata 0 -b 3 -b 2 -b 1 newvrt.vrt rgb-mosaic.tif -co COMPRESS=DEFLATE -co PHOTOMETRIC=rgb -co BIGTIFF=YES -co ALPHA=NO

#remove vrt
rm newvrt.vrt

echo 'complete'
