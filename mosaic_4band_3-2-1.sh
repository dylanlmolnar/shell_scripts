echo 'starting script'

#create a mosaic vrt from all tifs in folder
gdalbuildvrt newvrt.vrt *.tif
echo 'vrt complete, now rendering as rgb and compressing'

#convert the vrt to show the visible bands 3,2,1 for 4-band ps
#use deflate compression
gdal_translate newvrt.vrt rgb-vrt.tif -b 3 -b 2 -b 1 -co COMPRESS=DEFLATE -co PHOTOMETRIC=rgb

echo 'complete'
