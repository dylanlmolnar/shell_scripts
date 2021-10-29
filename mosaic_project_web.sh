echo 'starting script'

#create a mosaic vrt from all tifs in folder
gdalbuildvrt newvrt.vrt *.tif
echo 'vrt complete, now reprojecting to EPSG:3587'

gdal_translate newvrt.vrt mosaic_project.tif -t_srs EPSG:3587 -co COMPRESS=DEFLATE -co PHOTOMETRIC=RGB 

