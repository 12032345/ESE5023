# Library
library(leaflet)

data(quakes)
quakes <-  head(quakes, 100)

mybins <- seq(4, 6.5, by=0.5)
mypalette <- colorBin( palette="Reds", domain=quakes$mag, na.color="transparent", bins=mybins)

m <- leaflet(quakes) %>% 
  addTiles()  %>% 
  setView( lat=-27, lng=170 , zoom=4) %>%
  addCircleMarkers(~long, ~lat, 
                   fillColor = ~mypalette(mag), fillOpacity = 0.7, color="white", radius=8, stroke=FALSE,
                   labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px"), textsize = "10px", direction = "auto")
  ) %>%
  addLegend( pal=mypalette, values=~mag, opacity=0.9, title = "Magnitude", position = "bottomright" )

m
# good work
