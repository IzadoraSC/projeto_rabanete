# installing/loading the package:
if(!require(installr)) {
    install.packages("installr");
    require(installr)
} #load / install+load installr

# using the package:
updateR()


# instalação do github
if(!require(devtools)){
    install.packages("devtools")
}

devtools::install_github ("TiagoOlivoto/pliman")


install.packages("pliman")

# Para instalar a vinheta HTML, use
devtools::install_github ("TiagoOlivoto/pliman", build_vignettes = TRUE)

# install.packages("remotes")
#
# install.packages("dados") #https://github.com/cienciadedatos/dados
# remotes::install_github("cienciadedatos/dados")

# install.packages("languageserver")

# install.packages("htmltools")

# install.packages("rmarkdown")

# install.packages("reticulate")

# reticulate::install_miniconda(force = TRUE)

# https://github.com/nemochina2008/favoriteRpackages


# inventory forest -------------------------------------

if (!require(forestmangr)) install.packages('forestmangr')     #inventario e manejo florestal
if (!require(BiodiversityR)) install.packages('BiodiversityR')   #analises ecologicas
if (!require(factoextra)) install.packages('factoextra')      #analises de dados multivariados
if (!require(flora)) install.packages('flora')           #dados do Flora Brasileira 2020
if (!require(florestal)) install.packages('florestal')       #amostragens para inventarios florestais


# data analyses  -------------------------------------
if(!require(dplyr)) install.packages('dplyr')

if(!require(agricolae)) install.packages("agricolae", dep = TRUE)


#' title: install packages
#' author: mauricio vancine
#' date: 2021-10-10
#' ---

# github packagesc
if(!require(devtools)) install.packages("devtools", dep = TRUE)

# data manipulation and visualization -------------------------------------
# manipulation and visualization
if(!require(tidyverse)) install.packages("tidyverse", dep = TRUE)

# directory
if(!require(here)) install.packages("here", dep = TRUE)

# xlsx
if(!require(openxlsx)) install.packages("openxlsx", dep = TRUE)
if(!require(readxl)) install.packages("readxl", dep = TRUE)
if(!require(writexl)) install.packages("writexl", dep = TRUE)

# data
if(!require(vegan)) install.packages("vegan", dep = TRUE)
if(!require(palmerpenguins)) install.packages("palmerpenguins", dep = TRUE)
if(!require(datasauRus)) install.packages("datasauRus", dep = TRUE)

# parallel
if(!require(parallel)) install.packages("parallel", dep = TRUE)

# plot
if(!require(ggpubr)) install.packages("ggpubr", dep = TRUE)
if(!require(psych)) install.packages("psych", dep = TRUE)
if(!require(cowplot)) install.packages("cowplot", dep = TRUE)
if(!require(patchwork)) install.packages("patchwork", dep = TRUE)
if(!require(gganimate)) devtools::install_github('thomasp85/gganimate')
if(!require(plotly)) install.packages("plotly", dep = TRUE)
if(!require(htmlwidgets)) install.packages("htmlwidgets", dep = TRUE)
if(!require(esquisse)) install.packages("esquisse", dep = TRUE)
if(!require(bayesplot)) devtools::install_github("stan-dev/bayesplot", dependencies = TRUE, build_vignettes = TRUE)
if(!require(ggsignif)) remotes::install_github("const-ae/ggsignif", source=T)
if(!require(openai)) install.packages("openai", dep = TRUE)
if(!require(ggstar)) install.packages("ggstar", dep = TRUE)

# geospatial data ---------------------------------------------------------

# data base web service - spatio temporal asset catalog
if(!require(rstac)) install.packages("rstac", dep = TRUE)
if(!require(rgee)) install.packages("rgee", dep = TRUE)

# vector
if(!require(sp)) install.packages("sp", dep = TRUE)
if(!require(sf)) install.packages("sf", dep = TRUE)
if(!require(st)) install.packages("st", dep = TRUE)
if(!require(geobr)) install.packages("geobr", dep = TRUE)
if(!require(rnaturalearth)) install.packages("rnaturalearth", dep = TRUE)
if(!require(rnaturalearthdata)) install.packages("rnaturalearthdata", dep = TRUE)
if(!require(rnaturalearthhires)) install.packages('rnaturalearthhires', repos = c('https://ropensci.r-universe.dev', 'https://cloud.r-project.org'))

# raster
if(!require(raster)) install.packages("raster", dep = TRUE)
if(!require(fasterize)) install.packages("fasterize", dep = TRUE)
if(!require(RStoolbox)) install.packages("RStoolbox", dep = TRUE)
if(!require(SpatialTools)) install.packages("SpatialTools", dep = TRUE)
if(!require(spatial.tools)) install.packages("spatial.tools", dep = TRUE)

# maps
if(!require(ggspatial)) install.packages("ggspatial", dep = TRUE)
if(!require(tmap)) install.packages("tmap", dep = TRUE)
if(!require(mapsf)) install.packages("mapsf", dep = TRUE)
if(!require(mapview)) install.packages("mapview", dep = TRUE)
if(!require(mapedit)) install.packages("mapedit", dep =TRUE)
if(!require(leaflet)) install.packages("leaflet", dep = TRUE)
if(!require(leafpm)) install.packages("leafpm", dep = TRUE)
if(!require(lwgeom)) install.packages("lwgeom", dep = TRUE)
# if(!require(viridis)) install.packages("viridis", dep = TRUE)
if(!require(wesanderson)) install.packages("wesanderson", dep = TRUE)
if(!require(cptcity)) install.packages("cptcity", dep = TRUE)


# end ---------------------------------------------------------------------


### install r packages

# github ------------------------------------------------------------------
if(!require(devtools)) install.packages("devtools")

# internet ----------------------------------------------------------------
if(!require(Rcpp)) install.packages("Rcpp")
if(!require(httpuv)) install.packages("httpuv")

# tidyverse ---------------------------------------------------------------
if(!require(broom)) install.packages("broom")
if(!require(cli)) install.packages("cli")
if(!require(crayon)) install.packages("crayon")
if(!require(dplyr)) install.packages("dplyr")
if(!require(dbplyr)) install.packages("dbplyr")
if(!require(forcats)) install.packages("forcats")
if(!require(ggplot2)) install.packages("ggplot2")
if(!require(haven)) install.packages("haven")
if(!require(hms)) install.packages("hms")
if(!require(httr)) install.packages("httr")
if(!require(jsonlite)) install.packages("jsonlite")
if(!require(lubridate)) install.packages("lubridate")
if(!require(magrittr)) install.packages("magrittr")
if(!require(modelr)) install.packages("modelr")
if(!require(purrr)) install.packages("purrr")
if(!require(readr)) install.packages("readr")
if(!require(readxl)) install.packages("readxl")
if(!require(reprex)) install.packages("reprex")
if(!require(rlang)) install.packages("rlang")
if(!require(rstudioapi)) install.packages("rstudioapi")
if(!require(rvest)) install.packages("rvest")
if(!require(stringr)) install.packages("stringr")
if(!require(tibble)) install.packages("tibble")
if(!require(tidyr)) install.packages("tidyr")
if(!require(xml2)) install.packages("xml2")
if(!require(tidyverse)) install.packages("tidyverse")
if(!require(writexl)) install.packages("writexl")

# ecological analysis -----------------------------------------------------
if(!require(iNEXT)) install.packages("iNEXT")
if(!require(ade4)) install.packages("ade4")
if(!require(adespatial)) install.packages("adespatial")
if(!require(betapart)) install.packages("betapart")
if(!require(factoextra)) install.packages("factoextra")
if(!require(FactoMineR)) install.packages("FactoMineR")
if(!require(spdep)) install.packages("spdep")
if(!require(vegan)) install.packages("vegan")
if(!require(ggvegan)) devtools::install_github("gavinsimpson/ggvegan")
if(!require(ggord)) devtools::install_github("fawda123/ggord")

# vegetation analysis -----------------------------------------------------
# install.packages("remotes")
remotes::install_github("eco-hydro/phenofit")
install.packages("phenofit", force = TRUE, dependencies = T)


# plot --------------------------------------------------------------------
if(!require(GGally)) install.packages("GGally")
if(!require(ggpubr)) install.packages("ggpubr")
if(!require(cowplot)) install.packages("cowplot")
if(!require(gridExtra)) install.packages("gridExtra")
if(!require(patchwork)) install.packages("patchwork")
if(!require(geomtextpath)) install.packages("geomtextpath")
if(!require(basemaps)) install.packages("basemaps")


# colors ------------------------------------------------------------------
# https://github.com/EmilHvitfeldt/r-color-palettes
if(!require(paletteer)) devtools::install_github("EmilHvitfeldt/paletteer")
if(!require(RColorBrewer)) install.packages("RColorBrewer")
if(!require(viridis)) install.packages("viridis")
if(!require(ggsci)) install.packages("ggsci")
if(!require(cptcity)) install.packages("cptcity")
if(!require(cartography)) install.packages("cartography")
if(!require(dichromat)) install.packages("dichromat")
if(!require(yarrr)) install.packages("yarrr")
if(!require(scico)) install.packages("scico")
if(!require(Redmonder)) install.packages("Redmonder")
if(!require(rcartocolor)) install.packages("rcartocolor")
if(!require(Polychrome)) install.packages("Polychrome")
if(!require(pals)) install.packages("pals")
if(!require(palr)) install.packages("palr")
if(!require(palettetown)) install.packages("palettetown")
if(!require(oompaBase)) install.packages("oompaBase")
if(!require(nord)) install.packages("nord")
if(!require(jcolors)) install.packages("jcolors")
if(!require(grDevices)) install.packages("grDevices")
if(!require(ghibli)) install.packages("ghibli")
if(!require(ggthemes)) install.packages("ggthemes")
if(!require(dichromat)) install.packages("dichromat")
if(!require(teamcolors)) install.packages("teamcolors")
if(!require(wesanderson)) devtools::install_github("karthik/wesanderson")
if(!require(ochRe)) devtools::install_github("ropenscilabs/ochRe")
if(!require(quickpalette)) devtools::install_github("EmilHvitfeldt/quickpalette")
if(!require(RSkittleBrewer)) devtools::install_github("alyssafrazee/RSkittleBrewer")
if(!require(NineteenEightyR)) devtools::install_github("m-clark/NineteenEightyR")
if(!require(LaCroixColoR)) devtools::install_github("johannesbjork/LaCroixColoR")
if(!require(ggpomological)) devtools::install_github("gadenbuie/ggpomological")
if(!require(dutchmasters)) devtools::install_github("EdwinTh/dutchmasters")
if(!require(awtools)) devtools::install_github("awhstin/awtools")

# data table --------------------------------------------------------------
if(!require(data.table)) install.packages("data.table")

# spatial analysis --------------------------------------------------------
if(!require(sp)) install.packages("sp")
if(!require(raster)) install.packages("raster")
if(!require(rgdal)) install.packages("rgdal") # sudo apt install libgdal-dev libproj-dev
if(!require(rgeos)) install.packages("rgeos")
if(!require(units)) install.packages("units")
# if(!require(udunits2)) install.packages("udunits2") # sudo apt install libudunits2-dev
if(!require(sf)) install.packages("sf")
if(!require(fasterize)) install.packages("fasterize")
if(!require(ggspatial)) install.packages("ggspatial")

# maps --------------------------------------------------------------------
if(!require(lwgeom)) devtools::install_github("r-spatial/lwgeom")
if(!require(tmap)) install.packages("tmap")
if(!require(tmaptools)) install.packages("tmaptools")
if(!require(maptools)) install.packages("maptools")
if(!require(mapview)) install.packages("mapview")
if(!require(leaflet)) install.packages("leaflet")
if(!require(cartography)) install.packages("cartography")
if(!require(rasterVis)) install.packages("rasterVis")

# landscape metrics -------------------------------------------------------
# if(!require(landscapeverse)) devtools::install_github("r-spatialecology/landscapeverse")
  # he goal of landscapeverse is to make it easy to install and load core packages for
 # landscape analysis in a single command (landscapemetrics, NLMR, landscapetools).
if(!require(landscapemetrics)) install.packages("landscapemetrics")
if(!require(NLMR)) install.packages("NLMR") #FALTA
if(!require(landscapetools)) install.packages("landscapetools")
if(!require(shar)) remotes::install_github("r-spatialecology/shar")
# Therefore, information about the location of the species is needed (as a point pattern) and about the environmental conditions (as a raster map).
if(!require(geodiv)) install.packages("geodiv")

# remote sensing ----------------------------------------------------------
if(!require(getlandsat)) install.packages("getlandsat")
if(!require(RStoolbox)) install.packages("RStoolbox")

# species distribution modeling -----------------------------------------------
# occ - download
if(!require(rgbif)) install.packages("rgbif")
if(!require(spocc)) install.packages("spocc")
if(!require(BIEN)) install.packages("BIEN")
if(!require(marinespeed)) install.packages("marinespeed") #FALTA
if(!require(robis)) install.packages("robis")

# occ - taxonomy
if(!require(worrms)) install.packages("worrms")
if(!require(rfishbase)) install.packages("rfishbase")
if(!require(taxize)) install.packages("taxize")

# occ - clear
if(!require(CoordinateCleaner)) install.packages("CoordinateCleaner")
if(!require(speciesgeocodeR)) devtools::install_github("azizka/speciesgeocodeR",
                                                       force = T)
if(!require(sampbias)) devtools::install_github("azizka/sampbias", force = T)

# var - limits
if(!require(rnaturalearth)) install.packages("rnaturalearth")
if(!require(rnaturalearthdata)) install.packages("rnaturalearthdata")
if(!require(rnaturalearthhires)) devtools::install_github("ropensci/rnaturalearthhires",
                                                          force = T) #FALTA
# if(!require(geobr)) install.packages("geobr")

# var - download
if(!require(sdmpredictors)) install.packages("sdmpredictors")

# var - selection
if(!require(usdm)) install.packages("usdm")
if(!require(psych)) install.packages("psych")

# algorithms
if(!require(biomod2)) install.packages("biomod2")
if(!require(dismo)) install.packages("dismo")
if(!require(sdm)) install.packages("sdm")

# algorithms only
# if(!require(kernlab)) install.packages("kernlab")
# if(!require(e1071)) install.packages("e1071")
if(!require(CENFA)) install.packages("CENFA")
# if(!require(earth)) install.packages("earth")
if(!require(ecospat)) install.packages("ecospat")
if(!require(gam)) install.packages("gam")
# if(!require(gbm)) install.packages("gbm")
# if(!require(mda)) install.packages("mda")
# if(!require(mgcv)) install.packages("mgcv")
if(!require(ncf)) install.packages("ncf")
# if(!require(nnet)) install.packages("nnet")
# if(!require(randomForest)) install.packages("randomForest")
# if(!require(rpart)) install.packages("rpart")

## INSTALANDO A PARTIR DAQUI
if(!require(rJava)) install.packages("rJava")
if(!require(ENMeval)) install.packages("ENMeval")
# if(!require(maxnet)) install.packages("maxnet")
if(!require(maxlike)) install.packages("maxlike")
if(!require(kuenm)) devtools::install_github("marlonecobos/kuenm")

# ensemble
if(!require(eSDM)) install.packages("eSDM")

# hierarchical bayesian
# hsdm
# cd ~/Downloads
# wget ftp://ftp.gnu.org/gnu/gsl/gsl-latest.tar.gz
# tar -xvzf gsl-latest.tar.gz
# cd gsl-2.5
# ./configure
# make
# sudo make install

if(!require(hSDM)) install.packages("hSDM")

# joint
if(!require(jSDM)) install.packages("jSDM") # sudo apt install -y libgsl-dev

# stacked species distribution models
if(!require(SSDM)) install.packages("SSDM")

# virtual species
if(!require(sdmvspecies)) install.packages("sdmvspecies")
if(!require(virtualspecies)) install.packages("virtualspecies")

# euclidean distance
# https://rpubs.com/Bruno_Vilela/279257

# markdown ----------------------------------------------------------------
if(!require(rmarkdown)) install.packages("rmarkdown")
if(!require(knitr)) install.packages("knitr")
if(!require(tinytex)) install.packages("tinytex")
if(!require(blogdown)) install.packages("blogdown")
if(!require(pagedown)) install.packages("pagedown")
if(!require(bookdown)) install.packages("bookdown")
if(!require(posterdown)) remotes::install_github("brentthorne/posterdown")
#install.packages("posterdown")
if(!require(xaringan)) install.packages("xaringan")
if(!require(xaringanthemer)) devtools::install_github("gadenbuie/xaringanthemer")
#install.packages("xaringanthemer")
if(!require(icons)) remotes::install_github("mitchelloharawild/icons")

# email -------------------------------------------------------------------
if(!require(gmailr)) install.packages("gmailr")

# googledrive -------------------------------------------------------------
if(!require(googledrive)) install.packages("googledrive")

# beep --------------------------------------------------------------------
if(!require(beepr)) install.packages("beepr")

# hexagon -----------------------------------------------------------------
if(!require(hexSticker)) install.packages("hexSticker")

# python ------------------------------------------------------------------
if(!require(reticulate)) install.packages("reticulate")

# shiny -------------------------------------------------------------------
if(!require(shiny)) install.packages("shiny")
if(!require(shinyjs)) install.packages("shinyjs")
if(!require(shinydashboard)) install.packages("shinydashboard")
if(!require(DT)) install.packages("DT")

# solo --------
remotes::install_github("loreabad6/terrain", dependencies = T)  #https://github.com/loreabad6/terrain

# outros -----
if (!require("pacman")) install.packages("pacman")

# end ---------------------------------------------------------------------

#Materiais para estudar R
## https://github.com/beatrizmilz/materiais_estudo_R
## https://materiais-estudo-r.netlify.app/

# Mauricio
# https://github.com/mauriciovancine/course-geospatial-data-r/
## https://mauriciovancine.github.io/teaching/


# GITHUB config
#### 1. Sign up at GitHub.com ################################################

## If you do not have a GitHub account, sign up here:
## https://github.com/join

# ----------------------------------------------------------------------------

#### 2. Install git ##########################################################

## If you do not have git installed, please do so:
## Windows ->  https://git-scm.com/download/win
## Mac     ->  https://git-scm.com/download/mac
## Linux   ->  https://git-scm.com/download/linux
##             or: $ sudo dnf install git-all

# ----------------------------------------------------------------------------

### 3. Configure git with Rstudio ############################################

## set your user name and email:
usethis::use_git_config(user.name = "YourName", user.email = "your@mail.com")

## create a personal access token for authentication:
usethis::create_github_token()
## in case usethis version < 2.0.0: usethis::browse_github_token() (or even better: update usethis!)

## set personal access token:
credentials::set_github_pat("YourPAT")

## or store it manually in '.Renviron':
usethis::edit_r_environ()
## store your personal access token in the file that opens in your editor with:
## GITHUB_PAT=xxxyyyzzz
## and make sure '.Renviron' ends with a newline

# ----------------------------------------------------------------------------

#### 4. Restart R! ###########################################################

# ----------------------------------------------------------------------------

#### 5. Verify settings ######################################################

usethis::git_sitrep()

## Your username and email should be stated correctly in the output.
## Also, the report shoud cotain something like:
## 'Personal access token: '<found in env var>''

## If you are still having troubles, read the output carefully.
## It might be that the PAT is still not updated in your `.Renviron` file.
## Call `usethis::edit_r_environ()` to update that file manually.

# ----------------------------------------------------------------------------

## THAT'S IT!

#####
Sys.getenv("GITHUB_PAT") # ver token
usethis::git_sitrep() # verificar
usethis::edit_r_environ() # editar token

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
