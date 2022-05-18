#!../../bin/darwin-x86/cs_tbl

## You may have to change cs_tbl to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("ENGINEER", "Engineer")
epicsEnvSet("LOCATION", "Location")

epicsEnvSet("AS_PATH", "${TOP}/autosave")
epicsEnvSet("IOC_PREFIX","MCT:CS_Y_TBL1")

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/cs_tbl.dbd",0,0)
cs_tbl_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("db/2jack_table.db","P=MCT:TBL1:,Q=CS_Y:,M1=US,M2=DS,LENGTH=2000")
dbLoadRecords("db/2jack_table_cs_motor.db","P=MCT:TBL1:,Q=CS_Y:,M1=US,M2=DS")
dbLoadRecords("db/iocAdminSoft.db", "IOC=$(IOC_PREFIX)")
dbLoadRecords("db/save_restoreStatus.db", "P=$(IOC_PREFIX):")

# Load the autosave configuration
cd iocBoot/${IOC}
< autosave.cmd

iocInit()

cd ${AS_PATH}/req 
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "")
create_monitor_set("info_settings.req", 15, "")

cd ${TOP}

