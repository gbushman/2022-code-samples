# 2022 Code Samples

This repository contains recent code samples of mine. These code samples are split across three domains. 

### 1. legislative-text-mining

This folder contains files related to a text mining project. The ultimate aim of the project was to identify key words related to risk and protective factors for youth violence and injury in recent Michigan legislation. 

- `create-dictionaries.R` : creates an .xlsx file with key words/search terms organized, by domain, in different sheets of the workbook
- `migov-webscraping.R` : scrapes the contents of recently published Michigan legislation (.pdf files), and searches for key words using search term lists created by the `create-dictionaries.R` script.

### 2. spatiotemporal-data-analysis

This folder contains code related to spatiotemporal analysis of crime incident data. The aim of this project was to assess the association between land bank program activity and microspatial (i.e., parcel-level) reductions in densities of violent crime, over time. 

- `arcpy-crime-kde-layers.py` : specifies methods for creating kernel density rasters, and extracting information from these rasters, using tools from the arcpy python library.
- `create-crime-kde-layers.RMD` : imports crime data files from various years; cleans, organizes, and concatenates multi-year data; converts numeric latitude/longitude information into spatial coordinates; projects coordinates; writes data to ArcGIS geodatabase; runs `arcpy-crime-kde-layers.py` to create/extract kernel density point estimates in geodatabase; imports kernel density estimates from geodatabase back into R; organizes output data for analysis. 
- `land-bank-stewardship-analyses.RMD` : spatiotemporal analysis of crime incident density data created by `create-crime-kde-layers.RMD`.

### 3. survey-data-analysis

This folder contains code related to two different survey data analysis projects. One project used data from the Census Bureau to examine associations between housing instability and health during COVID, while the other project aimed to assess the associations between school-based exposures to violence and youth firearm carriage behaviors in a nationally representative sample of school-aged youth. 

- `covid-housing-manuscript-results-weighted-svy.RMD` : survey weighted analysis of Census Pulse data examining associations between housing and health. 
- `facts-firearmcarriage-parallelmed.RMD` : survey weighted structural equation models examining psychosocial mediators of the relationship between school-based violence exposure and youth firearm carriage. 
