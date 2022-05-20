# import packages/libraries
import os, sys, re, shutil
import arcpy
from arcpy.sa import *
import arceditor


# define workspace
workingGDB = "C:/Users/grego/Documents/ArcGIS/Projects/PRC Work/YVPC/crime-kernel-density-calcs/crime-kernel-density-calcs.gdb"
arcpy.env.workspace = workingGDB
arcpy.env.overwriteOutput = True


# define kenrnel density function
def kernel_density(dataset):
    try:
        if arcpy.CheckExtension("Spatial") == "Available":
            arcpy.CheckOutExtension("Spatial")
        else:
            raise LicenseError
        kd = KernelDensity(dataset, population_field = 'NONE', cell_size = 50, search_radius = 850, area_unit_scale_factor='SQUARE_MILES', out_cell_values = 'DENSITIES', method = 'GEODESIC', in_barriers = 'flint_1000m')
        kd.save(workingGDB + "\\" + dataset + "_kd")
    finally:
            arcpy.CheckInExtension("Spatial")


# define stseg extraction function for kernel density rasters
def stseg_rastervalue_extraction(kdraster):
    try:
        if arcpy.CheckExtension("Spatial") == "Available":
            arcpy.CheckOutExtension("Spatial")
        else:
            raise LicenseError
        output_features = workingGDB + "\\" + kdraster + "_stseg_extract"
        ExtractValuesToPoints(in_point_features = 'flint_stseg_centroids', in_raster = kdraster, out_point_features = output_features)
    finally:
            arcpy.CheckInExtension("Spatial")


# define parcel extraction function for kernel density rasters
def parcel_rastervalue_extraction(kdraster):
    try:
        if arcpy.CheckExtension("Spatial") == "Available":
            arcpy.CheckOutExtension("Spatial")
        else:
            raise LicenseError
        output_features = workingGDB + "\\" + kdraster + "_parcel_extract"
        ExtractValuesToPoints(in_point_features = 'flint_parcel_centroids', in_raster = kdraster, out_point_features = output_features)
    finally:
            arcpy.CheckInExtension("Spatial")


# run kernel density calculations
months = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
years = range(2015,2020)

for y in years:
    for m in months:
        p1_layer_name = 'p1crimes_' + m + '_' + str(y)
        kernel_density(p1_layer_name)
        stseg_rastervalue_extraction(p1_layer_name + '_kd')
        parcel_rastervalue_extraction(p1_layer_name + '_kd')
