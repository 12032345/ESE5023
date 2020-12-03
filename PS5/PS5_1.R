library("sp")
library("raster")
library("sf")
library("rgdal")


#1.1 load the data set
wind <- raster("wc2.1_2.5m_wind_11.tif")
srad <- raster("wc2.1_2.5m_srad_11.tif")
prec <- raster("wc2.1_2.5m_prec_11.tif")

#1.2 plot the above data sets over China
# Read china map
China_map <- readOGR("C:/Users/dell/Desktop/China_map", "bou2_4p") 
plot(China_map)
# Crop the raster with china map
#srad_crop <- crop(srad, China_map)
#prec_crop <- crop(prec, China_map)
#wind_crop <- crop(wind, China_map)
# plot srad
srad_crop <- crop(srad, China_map)
srad_crop_china <- srad_crop %>%
  mask(China_map, na.rm=TRUE)
plot(srad_crop_china, main="Srad speed in November.",legend.args=list(text="kJ/m2/day",cex=1.25))
# plot prec
prec_crop <- crop(prec, China_map)
prec_crop_china <- prec_crop %>%
  mask(China_map, na.rm=TRUE)
plot(prec_crop_china, main="prec speed in November.",legend.args=list(text="mm",cex=1.25))
# plot wind
wind_crop<- crop(wind, China_map)
wind_crop_china <- wind_crop %>%
  mask(China_map, na.rm=TRUE)
plot(wind_crop_china, main="Wind speed in November.",legend.args=list(text="m/s",cex=1.25))

#1.3 search for regions with relatively high wind speed 
plot(wind_crop_china,  main="wind speed in china in Novermber")
contour(wind_crop_china, add=T, levels=seq(from=4, to=12, by=1),col="#00BFFF")

#1.4 search for regions with relatively high solar radiation and low precipitation
plot(prec_crop_china,  main="prec speed in china in November")
contour(prec_crop_china, add=T,levels=seq(from=0,to=40,by=10), col="#F08080")
plot(srad_crop_china,  main="solar radiation in china in November")
contour(srad_crop_china, add=T,levels=seq(from=14000,to=18000,by=500), col="#00BFFF")