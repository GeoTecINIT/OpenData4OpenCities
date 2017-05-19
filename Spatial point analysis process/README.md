## Spatial point process analysis using Open Data, Toward to create a intensity network for Medellin City using car accidents events and street network. 

This section cover the second activity made during the last AGILE pre Conference full day workshop. This section is a tutuorial where you will find all the steps to create a intensity network using a spatial point process analyisis. The methodology proposed here is part of current research Esr12 in GeoC:Enabling Open Cities, lead by P.hD Candidate Mohamad Medhi Moradi and is a use case to apply aforementioned method using avaliable open data in Medellin City. To get more details of the method do not hesitage to contac us. 

## Software requeried

* 1. R 
* 2. R Studio
* 3. Rtools
* 4. R packages are needed

## Data used.

The open data used in this tutorial was obtanied in open data portals in Medellin City. The portals that have been used are:
* [Map Catalog Open Data](https://www.medellin.gov.co/geonetwork/srv/spa/catalog.search#/search?resultType=details&from=1&to=20&sortBy=relevance)
* [Open Geo Data Portal](https://geomedellin-m-medellin.opendata.arcgis.com/)

Open Datasets used in this tutorials are:

Raw Data
* 1. [Car accidents in Medellin City year 2016](https://geomedellin-m-medellin.opendata.arcgis.com/datasets?q=accidentalidad%202016)
* 2. [Street Network in Medelin City Year 2014](https://www.medellin.gov.co/geonetwork/srv/spa/catalog.search#/search?resultType=details&from=1&to=20&sortBy=relevance&fast=index&_content_type=json&any=malla)

## Step 1: Setup and Install software requeriments.

In order to get ready for the session on spatial point processes, you may find the following information
useful.

* 1. Find and install the latest version of R from [here](https://cran.r-project.org/)
* 2. Download and install the latest version of RStudio from [here](https://www.rstudio.com/products/rstudio/download2/)
* 3. Find and install the latest version of Rtools.exe [here](https://cran.r-project.org/) if you are a Windows user. 
* 4. Open RStudio and install packages \spatstat.utils, \spatstat and \maptools, you can use the following codes:
```
install.packages("spatstat.utils")
```
```
install.packages("spatstat")
```
```
install.packages("maptools")
```
* 5. We may need the latest unpublished version of \spatstat.utils and \spatstat, you can install latest version from GitHub through following codes:
```
require(remotes)
```
```
install github('spatstat/spatstat.utils')
```
```
install github('spatstat/spatstat')
```
* 6. If you do not have \remotes" installed, you should first run
```
install.packages("remotes")
```
* 7. You may need to study some parts of [Spatial Point Patterns: Methodology and Applications with
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
