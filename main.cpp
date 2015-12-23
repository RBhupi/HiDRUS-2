/*!
 * File:   main.cpp
 * \author: Bhupendra Raut
 * \brief: This program takes in a configuration file as shown in example and produces
 *  simulation for the given parameters.
 *  
 * This program uses MapBase only for regridding purpose. 
 * @ToDo Remove all the references to MapBase and use other regrid function. 
 */

#include <string>
#include <iostream>
#include <vector>
#include <cstring>
#include <errno.h>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include "GeneralUtils.hh"
#include "MapBaseControl.hh"
#include "stochastic_cascade.h"
#include "hidrus15_params.h"
#include "btime_mo.h"
#include "ncio.hh"
#include "stats.hh"

using namespace std;
string DIRSEP = "/";

void usage_hidrus15();
time_t hidrus_frontmatter(); //returns current system time
float dbz2rr(float);


float ZRA = 240.0;
float ZRB = 1.5;

int
main(int argc, char** argv) {
    time_t start_t = hidrus_frontmatter();

    //Read the arguments and extract input filename
    if (!argv[1]) usage_hidrus15();
    string inFileName = argv[1];

    //Read configuration file.
    hidrus_params inParams;
    inParams.read_configlist(inFileName); 
    char cascFileName[512];
    strcpy(cascFileName, inParams.outFileName);
    strcat(cascFileName, "cascf");
    
    char ofName[512] = {0}; //output file name
    
    //This replaces the config.txt values with the arguments
    if(argv[2]) inParams.ens_id=atoi(argv[2]);
    if(argv[3]) {
        memset(inParams.prmFileName, 0, sizeof(inParams.prmFileName));       
        strcpy(inParams.prmFileName, argv[3]);
    }
    
    sprintf(ofName, "%s_%03d", inParams.outFileName, inParams.ens_id);
    cout << " output file is --> " << ofName << endl;

    //Number of lat-lon in output netcdf file after cropping the data
    const int nlat = inParams.nlines - inParams.crop_lat_N - inParams.crop_lat_S;
    const int nlon = inParams.nsamples - inParams.crop_lon_E - inParams.crop_lon_W;

    //to convert m/s to pix/time-step
    float convFactor = inParams.tstep * 60.0 / (inParams.psize_l * 1000.0); 

    //create an output mapbase object
    MapBaseControl *outMap; //output MapBase object
    hyMapParameters mParm;
    hyProjectionParameters pParm; //

    //This will go into projection file.
    pParm.FileName = ofName;
    pParm.NoLines = inParams.nlines;
    pParm.NoSamples = inParams.nsamples;
    pParm.EastMax = (inParams.nsamples / 2)*1000; //distance from center in meters
    pParm.EastMin = -(inParams.nsamples / 2)*1000;
    pParm.NorthMax = (inParams.nlines / 2)*1000;
    pParm.NorthMin = -(inParams.nlines / 2)*1000;
    pParm.UnitX = PROJ_U_METRES; //units meters
    pParm.UnitY = PROJ_U_METRES;
    pParm.ProjectionType = PROJ_GNOMONIC; //projection
    pParm.SpheroidName = "GRS80";
    //need to make it flexible for all the cities
    pParm.ListDouble[0] = -37.852000; //radar lat
    pParm.ListDouble[1] = 144.752000; //radar lon
    pParm.ListDouble[2] = 1000.0; //cappi height in meters
    mParm.Flag = MB_RAININTENSITY | MB_COMPRESSED; //data type
    mParm.IsSimulated = true;
    int status;

    //Initialize MapBase object with the above values and create a file for writing
    outMap = new MapBaseControl(pParm, mParm, MB_CREATE);
    float **pdat = outMap->GetDataArray(); //This will store data for writing. (window for data between program and database)
    float *dataArray; //This will have actual data before it goes to **pdat.
    dataArray = new float[inParams.nlines * inParams.nsamples]; //resize it as required


    cout << " making parameters for output projection ..." << endl;
    float separation = 0.01f;
    float dist = (pParm.NoSamples / 2) * separation;
    float refLat = outMap->GetRefLat();
    float refLon = outMap->GetRefLon();
    float EMin = refLon - dist;
    float NMin = refLat - dist;
    float EMax = EMin + pParm.NoSamples*separation;
    float NMax = NMin + pParm.NoLines*separation;
    printf(" Grid Separation = %f \n RefLat = %f \n RefLon = %f \n ", separation, refLat, refLon);

    //temporary output MapBase for lat-lon projection
    MapBaseControl *tempMB;
    string tempBase = ofName;
    tempBase.append("_temp");

    hyMapParameters temp_mParm;
    hyProjectionParameters temp_pParm;
    temp_mParm = mParm;
    temp_pParm = pParm;
    temp_pParm.FileName = tempBase;
    temp_pParm.EastMax = EMax;
    temp_pParm.EastMin = EMin;
    temp_pParm.NorthMax = NMax;
    temp_pParm.NorthMin = NMin;
    temp_pParm.UnitX = PROJ_U_DEGREES;
    temp_pParm.UnitY = PROJ_U_DEGREES;
    temp_pParm.ProjectionType = PROJ_LATLON;
 

    tempMB = new MapBaseControl(temp_pParm, temp_mParm, MB_CREATE);
    cout << " Rainfall tag " << temp_pParm.Label << endl;

    float **pdat_temp = tempMB->GetDataArray(); //getting data array pointer


    //Making Netcdf file for output.
    string outFile = ofName;
    outFile.append(".nc");
    cout << " Creating "<<outFile<<endl;
   
    vector <float> lats;
    vector <float> lons;
    vector <float> grid;
    
    vector <float> grid_rain;
    vector <float> grid_dbz;

    //fill lat and lon arrays with values
    for (int lat = 0; lat < nlat; lat++)
        lats.push_back(NMin + separation * lat);

    for (int lon = 0; lon < nlon; lon++)
        lons.push_back(EMin + separation * lon);

    //Make 3 output netCDF-4 files using above tempMB information
    //for each time-step
    ncwrite_llt *outnc;
    outnc = new ncwrite_llt(outFile, "lat", "lon", "time", "rain", nlat, nlon, inParams.lat_units,
            inParams.lon_units, inParams.rec_units, inParams.var_units, inParams.fill_val);
    outnc->set_deflatLevel(inParams.deflat);
    
    outnc->write_all_dims(&lats, &lons);  
    outnc->write_var_att("long_name", "instantaneous rainrate");
    outnc->write_var_att("_description", inParams.description);
    
    //To write mean area input-output statistics to the file.
    stats ostatf(ofName);

    //make a stochastic cascade object
    Stochastic_Cascade *sCasc;
    sCasc = new Stochastic_Cascade(inParams.nlines, inParams.nsamples, inParams.nLags + 1,
            inParams.tstep, inParams.psize_l, MISSING_DATA, NULL, (char*) cascFileName, &status);

    int cascadeSize = sCasc->get_cascade_size();
    bool init = true;
    float rrate=0.0;

    float *eVel = new float [cascadeSize * cascadeSize];
    float *sVel = new float [cascadeSize * cascadeSize];

    /* ------------ Here, We make a pMatch_target array.----------------- */
    int pmSize=inParams.nlines * inParams.nsamples;
    float pMatch_target[pmSize];
    /*--------------------------------------------------------------------*/




    //open sim-params file and skip the header
    int mb_status=0;
    char line[1024] = {0};
    FILE *prmFile;
    prmFile = fopen(inParams.prmFileName, "r");
    if (prmFile == NULL){
        cerr<<"Error opening prmFile "<<inParams.prmFileName<<endl;
        cerr<<std::strerror(errno)<<endl;
        exit(errno);
    }
    if (inParams.prmHeader) fgets(line, 1024, prmFile);
    
    while (inParams.read_simparams(prmFile)) {
        if (inParams.fieldStd <= 0) { //put zeros for no-rain
            outnc->write_data(0.0f, inParams.mapTime); //filled with zeros
            init = true; // to re-initialize cascade for next spell of rain  
            continue;
        }
        overwrite_current_tStep(inParams.mapTime);
        inParams.revise_parameters(); //beta parameters will be  set to sensible values. This removes clutter effect from the simulated rainfall.

        //converting m/s to pixels/time-step
        inParams.south *= convFactor;
        inParams.east *= convFactor;

        for (int i = 0; i < cascadeSize * cascadeSize; i++) {
            eVel[i] = inParams.east;
            sVel[i] = inParams.south;
        }
       
        //sCasc->set_parameters(inParams.std, inParams.phi, inParams.fieldMean, inParams.fieldStd, inParams.betaOne, inParams.betaTwo);

        sCasc->set_velocities(eVel, sVel);
        sCasc->set_scaling_parms(inParams.hsOne, inParams.hsTwo, inParams.lOne);
        sCasc->set_parameters_s(inParams.fieldMean, inParams.fieldStd);
        sCasc->set_default_autocor();

        //Initialize cascade if it is the first image OR new rain event on that day
        if (init) {
            sCasc->init_cascade();
            init = false;
        }

        /* Here, we get the pMatch array from MapBase file.
         * and pass it to the sCasc object.*/
        inParams.get_pMatchTarget(pmSize, pMatch_target);
        sCasc->pMatch->set_reference(pMatch_target, pmSize);

        /* Receive generated stochastic field in the dataArray */
        sCasc->stochastic_forecast(dataArray);
        
        grid_rain.clear();
        grid_dbz.clear();
        
        for (int iLine = 0; iLine < inParams.nlines; iLine++) {
            for (int iSample = 0; iSample < inParams.nsamples; iSample++) {
                int offset = iSample + iLine * inParams.nsamples;              

                //First copy the reflectivity to grid_dbz for tStats.
                if(dataArray[offset]<15)
                    grid_dbz.push_back(0.0);
                else
                    grid_dbz.push_back(dataArray[offset]);
                
                //Now convert to rain and copy it to grid_rain and pdat
                rrate=dbz2rr(dataArray[offset]);

                if (rrate<0.1){
                    pdat[iLine][iSample] = 0.0;
                    grid_rain.push_back(pdat[iLine][iSample]);
                }
                else{
                    pdat[iLine][iSample] = rrate;
                    grid_rain.push_back(pdat[iLine][iSample]);
                }
            }
        }

        // Write statistics to the stats file.
        ostatf.write_stats(inParams, &grid_dbz, &grid_rain);
        
        //Write data to outMap file.
        outMap->WriteToBufferAndDatabase(inParams.mapTime); 

        //Transform the co-ordinates to lat-lon grid
        outMap->TransformCoordinates(*tempMB, 3, 3, 1.0);
        mb_status = tempMB->ReadFromDatabase(inParams.mapTime);

        grid.clear();
        //write data to NetCDF grid     
        for (int iLine = inParams.crop_lat_S, gLine = 0; iLine < pParm.NoLines - inParams.crop_lat_N; iLine++, gLine++) {
            for (int iSample = inParams.crop_lon_E, gSample = 0; iSample < pParm.NoSamples - inParams.crop_lon_W; iSample++, gSample++) {
                if (pdat_temp[iLine][iSample] < 0)
                    grid.push_back(inParams.fill_val);
                else if (pdat_temp[iLine][iSample] < 0.1 && pdat_temp[iLine][iSample] >= 0) //to avoid very small values from leaking into NC file.
                    grid.push_back(0.0);
                else
                    grid.push_back(pdat_temp[iLine][iSample]);
            }
        }

            outnc->write_data(grid, inParams.mapTime);
    }

    //clean up all the files on the disc
    delete_MBFiles(tempBase);
    delete_MBFiles(ofName);
    //free all the memory blocks.
    sCasc-> ~Stochastic_Cascade();
    fclose(prmFile);
    delete(outMap);
    delete(tempMB);
    delete(outnc);
    delete [] dataArray;
    delete [] eVel;
    delete [] sVel;
    

    time_t end_t = time(NULL);
    string runTime = get_niceTime(end_t - start_t);
    cout << "Total elapsed time for this run was " << runTime <<" hours."<< endl;
    return (0);
}

void usage_hidrus15() {
    cerr << "! Usage: HiDRUS-2 " << endl;
    cerr << "        $ ./hidrus2 <config.txt> <optional Ens_id> <optional prmFileName>" << endl << endl;
    cerr << "If Ens_id is provided, it will over-write the Ens_IDNumber field in config.txt."<<endl;
    cerr << "If prmFileName is provided, it will over-write the prmFileName field in config.txt."<<endl;
    exit(-1);
};

time_t hidrus_frontmatter() {
    cout << "-------------------------------------------------------------------" << endl;
    cout << "   High-resolution Downscaling of Rainfall Using STEPS (HiDRUS)" << endl;
    cout << "                                                  --Scheme 2" << endl;
    cout << "-------------------------------------------------------------------" << endl;
    return (time(NULL));
};

float dbz2rr(float dbz) {
    return (pow((pow(10.0, dbz / 10.0)) / ZRA, 1.0 / ZRB));
};