## Spatial point process analysis using Open Data, Toward to create a intensity network for Medellin City using car accidents events and street network. 

This section cover the second activity made during the last AGILE pre Conference full day workshop. This section is a tutuorial where you will find all the steps to create a intensity network using a spatial point process analyisis. The methodology proposed here is part of current research Esr12 in GeoC:Enabling Open Cities, lead by P.hD Candidate Mohamad Medhi Moradi and is a use case to apply aforementioned method using avaliable open data in Medellin City. To get more details of the method do not hesitage to contac us. 

![alt text](https://github.com/GeoTecINIT/OpenData4OpenCities/blob/master/images/IMG_0811.JPG)

## Software requeried

* R 
* R Studio
* Rtools
* R packages are needed

## Data that will be used.

The open data used in this tutorial was obtanied in open data portals in Medellin City. The portals that have been used are:
* [Map Catalog Open Data](https://www.medellin.gov.co/geonetwork/srv/spa/catalog.search#/search?resultType=details&from=1&to=20&sortBy=relevance)
* [Open Geo Data Portal](https://geomedellin-m-medellin.opendata.arcgis.com/)

Open Datasets used in Shapefile format in this tutorials are:
Raw Data (Without any modification)
* [Car accidents in Medellin City year 2016](https://geomedellin-m-medellin.opendata.arcgis.com/datasets?q=accidentalidad%202016)
* [Street Network in Medelin City Year 2014](https://www.medellin.gov.co/geonetwork/srv/spa/catalog.search#/search?resultType=details&from=1&to=20&sortBy=relevance&fast=index&_content_type=json&any=malla)

## More resources
You may need to study some parts of [Spatial Point Patterns: Methodology and Applications with R](https://www.crcpress.com/Spatial-Point-Patterns-Methodology-and-Applications-with-R/Baddeley-Rubak-Turner/p/book/9781482210200), especially last chapter.


## Step 1: Setup and Install software requeriments.

In order to get ready for the analysis on spatial point processes.

* Find and install the latest version of R from [here](https://cran.r-project.org/)
* Download and install the latest version of RStudio from [here](https://www.rstudio.com/products/rstudio/download2/)
* Find and install the latest version of Rtools.exe [here](https://cran.r-project.org/) if you are a Windows user. 
* Open RStudio and install packages \spatstat.utils, \spatstat and \maptools, you can use the following codes:
```
install.packages("spatstat.utils")
```
```
install.packages("spatstat")
```
```
install.packages("maptools")
```
* We may need the latest unpublished version of \spatstat.utils and \spatstat, you can install latest version from GitHub through following codes:
```
require(remotes)
```
```
install github('spatstat/spatstat.utils')
```
```
install github('spatstat/spatstat')
```
* If you do not have \remotes" installed, you should first run
```
install.packages("remotes")
```

## Step 2. Fixing Raw Datasets 

As usual in many of cities' open data portals, the avaliable data have many issue that should be fixed before the analysis process start. The data properties and condition for the data analysis are described as following:

### Connectivity

In order to run properly the Spatial Point Process analysis we must guarantee that there is not isolate lines, "island" of lines or dissconected lines along all street networks.

You can validate their connectivity using a GIS client such as ArcGIS or QGIS even thougth R.

* ArcGIS: 

* QGIS:

* R:

### Spatial Reference should be the same for both points events and street network:
Lot of Open data portals handle their own spatial reference system, especially the cities' open data portals which have local data using local datum or not custumized datum for their reference. Useful for them when they need more accuary.

You MUST guarantee that both dataset has the same spatial reference. 

## Step 3. Analisys.
