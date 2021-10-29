echo 'starting script'

#create a mosaic vrt from all tifs in folder
gdalbuildvrt newvrt.vrt *.tif
echo 'vrt complete, now rendering as rgb and compressing'

#convert the vrt to show the visible bands 3,2,1 for 4-band ps
gdal_translate newvrt.vrt 3-2-1_vrt.vrt -b 3 -b 2 -b 1

#scale to 8bit
#I just put 0 2500, seems to be close to most of the tifs I have used. use "gdalinfo -mm" to find exact
gdal_translate -ot Byte -scale 0 2500 0 255 -exponent 0.4 3-2-1_vrt.vrt mosaic-rgb.vrt

#use deflate compression and convert to tif
gdal_translate mosaic-rgb.vrt mosaic-rgb.tif -co COMPRESS=DEFLATE -co BIGTIFF=YES

#remove all vrt files
del *.vrt

echo 'complete'
