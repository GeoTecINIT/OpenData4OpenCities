# Open Data for Open Cities full day Workshop: Re-use and discovery level, applied to the spatial point analysis process on linear networks.

5th Participatory Workshop of [initiative CityData 3.0](http://opendata4opencities.uji.es) for AGILE 2017 Conference in  Wageningen University, The Netherlands.

In case you find the resources of this page useful to incorporate them in your projects or research, the authors appreciate to be mentioned. 
Fernando Benitez, Universitat Jaume I, Spain - benitezm@uji.es
Mohammad Medhi Moradi, Universitar Jaume I, Spain - moradi@uji.es
[GeoC: Enabling Open Cities](http://geo-c.eu/)

Find here the detailed agenda of this workshop, the presentations slides, and our keynote speaker presentation, from European Data Portal. http://opendata4opencities.uji.es

## Hand-on Excersices and Open Discussion. 
The purpose of the hands-on session is to cover the discussion about reuse of open data, and apply the current open data in a spatial point process which needs some instruccton to get the rigth results, during this workshop we will cover some theorical aspects relates to how open data should be gathered and how we can analyst using point processes.

## Before the Workshop

### DO NOT FORGET TO BRING YOU OWN COMPUTER AND FOLLOW THE INSTALLATION INSTRUCTIONS [here](https://github.com/GeoTecINIT/OpenData4OpenCities/blob/master/Installation%20Instruccions/Instuctions4SpatialPointProcessAnalysis.pdf) FOR THE INTERACTIVE SESSION WITH POINT PROCESS ANALYSIS 

## Install software requeriments.

In order to get ready for the session on spatial point processes, you may nd the following information
useful.
1. Find and install the latest version of R from [here](https://cran.r-project.org/)
2. Download and install the latest version of RStudio from [here](https://www.rstudio.com/products/rstudio/download2/)
3. Find and install the latest version of Rtools.exe [here](https://cran.r-project.org/) if you are a Windows user. 
4. Open RStudio and install packages "spatstat.utils", "spatstat" and "maptools", you can use the following codes:
```
install.packages("spatstat.utils")
```
```
install.packages("spatstat")
```
```
install.packages("maptools")
```
5. We may need the latest unpublished version of "spatstat.utils" and "spatstat", you can install
latest version from GitHub through following codes:
```
require(remotes)
```
```
install_github('spatstat/spatstat.utils')
```
```
install_github('spatstat/spatstat')
```
If you do not have "remotes" installed, you should first run
```
install.packages("remotes")
```
6. You may need to study some parts of [Spatial Point Patterns: Methodology and Applications with
R](https://www.crcpress.com/Spatial-Point-Patterns-Methodology-and-Applications-with-R/Baddeley-Rubak-Turner/p/book/9781482210200), especially last chapter.

## Datasets 

This wokrshop and method requiere at least two kind of datasets.

* Street Network:
Shapefile of the streets network. provided by [Medellin Open Data portal.](https://geomedellin-m-medellin.opendata.arcgis.com/)

* Dots or event points:
For the workshop we use accident points in a shapefile provided by [Medellin Open Data portal.](https://geomedellin-m-medellin.opendata.arcgis.com/)


## Validating the spatial data requeriments.
We use some open data from some cities for this workshop, however as you know some of open data do not fit the spatial analysis requeriments, and we need to do some steps before to have the correct data for our analysis. Here some stept that you MUST guarantee before rum some lines in R. 

* Validate the spatial reference:
Lots of Open data portals handle thier own spatial reference system, especially the cities' open data portals which have local data using local datum or not custumized datum for their reference. Useful for them when they need more accuary.

You MUST guarantee that both dataset (events and network) have the same spatial reference. 

* Validate the connectity along street network.
In order to run properly the R analysis we must guarantee that there is not isolate lines, or "island" of lines, all networks should be connected. 
You can validate their connectivy using a GIS client such as ArcGIS or QGIS.
1. ArcGIS
2.QGIS.


## DETAILED AGENDA 

* [9:00 – 9:30	Opening and Introduction to the workshop.	Joaquin Huerta, Fernando Benitez, Mehdi Moradi]
* [9:30 – 10:00	Keynote Talk:  Barriers in working with  Open Data.	Heleen Vollers, European Data Portal.]
* [10:00 – 10:20	Open data portals as part of the open data ecosystem?  Lessons learned from geoportal research.	Bastiaan van Loenen, Knowledge Centre Open Data. Joep Crompvoets, Instituut Voor de Overheid]
* [10:30 – 10:50	Integrating geological and seismological data in point process models for seismical analysis.	Marianna Siino,  Dipartimento di Scienze Economiche, Italy]
* [11:00 – 11:20	Crime and Open Data, Use case Spain.	Raquel Martin-Pozuelo, Master GeoTec, Spain]
* [11:30 – 11: 40	Open data and disaster management.	Ditsuhi Iskandaryan, Master GeoTec, Spain]
* [12:00 – 13:00	Lunchtime]
* [13:00 – 14:30	Hands-on session: Finding relevant open geographic data in cities.	Fernando Benitez]
* [15:00 – 16:30	Interactive session with point process analysis: Learn how to find the hotspots in cities’ street network.	Mohamad Mehdi Moradi]
* [16:30 – 17:00	Open Discussion and Conclusions for a workshop report and future outcomes.	Joaquin Huerta, Fernando Benitez, Mehdi Moradi]

## Keynote Speaker.
Heleen Vollers: Senior Management Consultant at Capgemini Consulting. She works in the Public Insights & Data practice of Capgemini Consulting where she is a member of Capgemini’s global EU account.

Heleen is actively involved in the development of the European Data Portal and associated services, on behalf of the European Commission – DG CONNECT. She is the stream lead on support services to countries as they mature on their Open Data journey and is in charge of stakeholder management. In addition, she leads the research work on measuring the level of Open Data maturity across Europe.

Before joining Capgemini Consulting, she worked as Director EU Affairs in Brussels representing the critical raw materials industry.

if yoy have some questions or comments please contact us by email to Fernando Benitez - benitezm@uji.es 
