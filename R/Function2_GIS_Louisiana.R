#' Generates points on a map of Louisiana
#' 
#' Takes a .csv file with global coordinates in decimal degrees (longitude and latitude)
#' and plots them to a map of Louisiana's rivers
#' 
#'  @param coords the read-in .csv file
#'  @param site_name the .csv file's site name column
#'  @return a map of Louisiana 
#'  @export plot_points 


plot_points <- function(coords, site_name){
        x = site_name
        z = coords
        a = z$x
        d = as.data.frame(z) %>% mutate(a, n())
        
        crs.geo <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
        proj4string(z) <- crs.geo
        louisiana <- readOGR(dsn = "/cloud/project/shapefiles", layer = "louisiana")
        la_river <- readOGR(dsn = "/cloud/project/shapefiles", layer = "river_louisiana")
        plot(louisiana, border = "black", lwd = 2)
        plot(la_river, col = "blue", border = "blue", add = T)
        title(main = "River Systems of Louisiana")
        plot(z, col = rainbow(d$n), add = T, cex = 1, lwd = 2)
}