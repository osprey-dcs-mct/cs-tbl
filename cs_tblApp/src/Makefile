TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = cs_tbl
# cs_tbl.dbd will be created and installed
DBD += cs_tbl.dbd

# cs_tbl.dbd will be made up from these files:
cs_tbl_DBD += base.dbd

# Include dbd files from all support applications:
cs_tbl_DBD += asyn.dbd
cs_tbl_DBD += busySupport.dbd
cs_tbl_DBD += calcSupport.dbd
cs_tbl_DBD += motorSupport.dbd
cs_tbl_DBD += devSoftMotor.dbd
cs_tbl_DBD += asSupport.dbd
cs_tbl_DBD += devIocStats.dbd

# Add all the support libraries needed by this IOC
cs_tbl_LIBS += asyn
cs_tbl_LIBS += busy
cs_tbl_LIBS += motor
cs_tbl_LIBS += softMotor
cs_tbl_LIBS += calc
cs_tbl_LIBS += autosave
cs_tbl_LIBS += devIocStats

# cs_tbl_registerRecordDeviceDriver.cpp derives from cs_tbl.dbd
cs_tbl_SRCS += cs_tbl_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
cs_tbl_SRCS_DEFAULT += cs_tblMain.cpp
cs_tbl_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#cs_tbl_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
cs_tbl_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

