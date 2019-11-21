#' Generates points on a map of Louisiana
#' 
#' Takes a .csv file with global coordinates in decimal degrees (longitude and latitude)
#' and plots them to a map of Louisiana's rivers
#' 
#'  @param coords the read-in .csv file
#'  @param site_name the .csv file's site name column
#'  @param longitude the name of the longitude name column
#'  @param latitude the name of the latitude name column
#'  @return a map of Louisiana with given points plotted
#'  @export plot_points 


plot_points <- function(coords, site_name, longitude, latitude){
        library(sp)
        library(rgdal)
        library(tidyverse)
        library(dplyr)
        x = site_name
        z = coords
        a = z$x
        long = longitude
        lat = latitude
        
        coordinates(z) <- c(long, lat)
        crs.geo <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
        proj4string(z) <- crs.geo
        louisiana <- readOGR(dsn = "/cloud/project/shapefiles", layer = "louisiana")
        la_river <- readOGR(dsn = "/cloud/project/shapefiles", layer = "river_louisiana")
        plot(louisiana, border = "black", lwd = 2)
        plot(la_river, col = "blue", border = "blue", add = T)
        title(main = "River Systems of Louisiana")
        d = as.data.frame(z) %>% mutate(a, n())
        plot(z, col = rainbow(d$n), add = T, cex = 1, lwd = 2)
}
