#this will project to web mercator and then convert to mbtiles (effecient for mapbox)
#ensure that you only have one tif in the current directory
echo 'starting script'

#create a mosaic vrt from all tifs in folder
gdalbuildvrt newvrt.vrt *.tif

echo 'vrt complete, now reprojecting to EPSG:3587'

gdalwarp -t_srs EPSG:3587  newvrt.vrt newvrt-projected.vrt 

echo 'project to web mercator, now convert to mbtiles'
gdal_translate -of MBTILES newvrt-projected.vrt new_tiles.mbtiles -co TILE_FORMAT=JPEG -co QUALITY=100

echo 'script complete'