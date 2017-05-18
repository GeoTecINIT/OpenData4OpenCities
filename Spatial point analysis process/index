## Install software requeriments.

In order to get ready for the session on spatial point processes, you may find the following information
useful.
1. Find and install the latest version of R from [here](https://cran.r-project.org/)
2. Download and install the latest version of RStudio from [here](https://www.rstudio.com/products/rstudio/download2/)
3. Find and install the latest version of Rtools.exe [here](https://cran.r-project.org/) if you are a Windows user. 
4. Open RStudio and install packages \spatstat.utils, \spatstat and \maptools, you can use the following codes:
```
install.packages("spatstat.utils")
```
```
install.packages("spatstat")
```
```
install.packages("maptools")
```
5. We may need the latest unpublished version of \spatstat.utils" and \spatstat", you can install
latest version from GitHub through following codes:
```
require(remotes)
```
```
install github('spatstat/spatstat.utils')
```
```
install github('spatstat/spatstat')
```
If you do not have \remotes" installed, you should first run
```
install.packages("remotes")
```
6. You may need to study some parts of [Spatial Point Patterns: Methodology and Applications with
R](https://www.crcpress.com/Spatial-Point-Patterns-Methodology-and-Applications-with-R/Baddeley-Rubak-Turner/p/book/9781482210200), especially last chapter.

## Datasets 

This workshop and analysis method requiere at least two kind of datasets.

* Street Network:
Shapefile of the streets network. provided by [Medellin Open Data portal.](https://geomedellin-m-medellin.opendata.arcgis.com/)

* Dots or event points:
For the workshop we will use accident points in a shapefile provided by [Medellin Open Data portal.](https://geomedellin-m-medellin.opendata.arcgis.com/)


## Validating the spatial data requeriments of open data.
We will use some open data from some cities for this workshop, however as you know some of open data do not fit the spatial analysis requeriments, and we need to do some steps before to have the correct data for our analysis. Here some stept that you MUST to guarantee before rum some lines in R. 

### Validate the spatial reference:
Lot of Open data portals handle their own spatial reference system, especially the cities' open data portals which have local data using local datum or not custumized datum for their reference. Useful for them when they need more accuary.

You MUST guarantee that both dataset has the same spatial reference. 

### Validate the connectivity along street network.
In order to run properly the R analysis we must guarantee that there is not isolate lines, or "island" of lines, all networks should be connected. 
You can validate their connectivy usng a GIS client such as ArcGIS or QGIS.
* ArcGIS.
* QGIS.
* R.
