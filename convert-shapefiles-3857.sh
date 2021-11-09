#convert shapefiles to web mercator

ogr2ogr output_web-mercator.shp -t_srs "EPSG:3857" *.shp