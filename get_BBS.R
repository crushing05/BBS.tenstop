# devtools::install_github('crushing05/rBBS')
# library(rBBS)

counts <- GetRouteData(TenStops = TRUE)
weather <- GetWeather()
routes <- GetRoutes()

bbs <- list(counts = counts, weather = weather, routes = routes)
saveRDS(bbs, 'bbs_tenstop.rds')
