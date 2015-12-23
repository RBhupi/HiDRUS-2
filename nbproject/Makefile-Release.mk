#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_DLIB_EXT=so
CND_CONF=Release
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/1250965836/bcascade.o \
	${OBJECTDIR}/_ext/1250965836/declare_array.o \
	${OBJECTDIR}/_ext/1250965836/fftw_util.o \
	${OBJECTDIR}/_ext/1250965836/gasrv_2.o \
	${OBJECTDIR}/_ext/1250965836/new_io_utils.o \
	${OBJECTDIR}/_ext/1250965836/optical_flow.o \
	${OBJECTDIR}/_ext/1250965836/pmatch.o \
	${OBJECTDIR}/_ext/1250965836/smoothing.o \
	${OBJECTDIR}/_ext/1250965836/steps_utilities.o \
	${OBJECTDIR}/_ext/1250965836/stochastic_cascade.o \
	${OBJECTDIR}/_ext/1250965836/valarray_convert.o \
	${OBJECTDIR}/_ext/1136725908/Kriging.o \
	${OBJECTDIR}/_ext/1136725908/MapBase.o \
	${OBJECTDIR}/_ext/1136725908/MapBaseControl.o \
	${OBJECTDIR}/_ext/1136725908/btime_mo.o \
	${OBJECTDIR}/_ext/1136725908/hyCommonSpheroid.o \
	${OBJECTDIR}/_ext/1136725908/hyImagePosition.o \
	${OBJECTDIR}/_ext/1136725908/hyPolarPosition.o \
	${OBJECTDIR}/_ext/1136725908/hyProjection.o \
	${OBJECTDIR}/_ext/1876510455/Exceptions.o \
	${OBJECTDIR}/_ext/1876510455/Log.o \
	${OBJECTDIR}/_ext/1876510455/Mutex.o \
	${OBJECTDIR}/_ext/565720769/GeneralUtils.o \
	${OBJECTDIR}/_ext/565720769/hidrus15_params.o \
	${OBJECTDIR}/_ext/565720769/ncio.o \
	${OBJECTDIR}/_ext/565720769/stats.o \
	${OBJECTDIR}/main.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/hidrus-2

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/hidrus-2: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/hidrus-2 ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/_ext/1250965836/bcascade.o: ../../DRaWSC/STEPS/bcascade.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/bcascade.o ../../DRaWSC/STEPS/bcascade.cpp

${OBJECTDIR}/_ext/1250965836/declare_array.o: ../../DRaWSC/STEPS/declare_array.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/declare_array.o ../../DRaWSC/STEPS/declare_array.cpp

${OBJECTDIR}/_ext/1250965836/fftw_util.o: ../../DRaWSC/STEPS/fftw_util.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/fftw_util.o ../../DRaWSC/STEPS/fftw_util.cpp

${OBJECTDIR}/_ext/1250965836/gasrv_2.o: ../../DRaWSC/STEPS/gasrv_2.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/gasrv_2.o ../../DRaWSC/STEPS/gasrv_2.cpp

${OBJECTDIR}/_ext/1250965836/new_io_utils.o: ../../DRaWSC/STEPS/new_io_utils.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/new_io_utils.o ../../DRaWSC/STEPS/new_io_utils.cpp

${OBJECTDIR}/_ext/1250965836/optical_flow.o: ../../DRaWSC/STEPS/optical_flow.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/optical_flow.o ../../DRaWSC/STEPS/optical_flow.cpp

${OBJECTDIR}/_ext/1250965836/pmatch.o: ../../DRaWSC/STEPS/pmatch.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/pmatch.o ../../DRaWSC/STEPS/pmatch.cpp

${OBJECTDIR}/_ext/1250965836/smoothing.o: ../../DRaWSC/STEPS/smoothing.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/smoothing.o ../../DRaWSC/STEPS/smoothing.cpp

${OBJECTDIR}/_ext/1250965836/steps_utilities.o: ../../DRaWSC/STEPS/steps_utilities.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/steps_utilities.o ../../DRaWSC/STEPS/steps_utilities.cpp

${OBJECTDIR}/_ext/1250965836/stochastic_cascade.o: ../../DRaWSC/STEPS/stochastic_cascade.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/stochastic_cascade.o ../../DRaWSC/STEPS/stochastic_cascade.cpp

${OBJECTDIR}/_ext/1250965836/valarray_convert.o: ../../DRaWSC/STEPS/valarray_convert.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1250965836
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1250965836/valarray_convert.o ../../DRaWSC/STEPS/valarray_convert.cpp

${OBJECTDIR}/_ext/1136725908/Kriging.o: ../../StoRM-1.0/simplyMapBase/hylib/Kriging.cc 
	${MKDIR} -p ${OBJECTDIR}/_ext/1136725908
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1136725908/Kriging.o ../../StoRM-1.0/simplyMapBase/hylib/Kriging.cc

${OBJECTDIR}/_ext/1136725908/MapBase.o: ../../StoRM-1.0/simplyMapBase/hylib/MapBase.cc 
	${MKDIR} -p ${OBJECTDIR}/_ext/1136725908
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1136725908/MapBase.o ../../StoRM-1.0/simplyMapBase/hylib/MapBase.cc

${OBJECTDIR}/_ext/1136725908/MapBaseControl.o: ../../StoRM-1.0/simplyMapBase/hylib/MapBaseControl.cc 
	${MKDIR} -p ${OBJECTDIR}/_ext/1136725908
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1136725908/MapBaseControl.o ../../StoRM-1.0/simplyMapBase/hylib/MapBaseControl.cc

${OBJECTDIR}/_ext/1136725908/btime_mo.o: ../../StoRM-1.0/simplyMapBase/hylib/btime_mo.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1136725908
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1136725908/btime_mo.o ../../StoRM-1.0/simplyMapBase/hylib/btime_mo.cpp

${OBJECTDIR}/_ext/1136725908/hyCommonSpheroid.o: ../../StoRM-1.0/simplyMapBase/hylib/hyCommonSpheroid.cc 
	${MKDIR} -p ${OBJECTDIR}/_ext/1136725908
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1136725908/hyCommonSpheroid.o ../../StoRM-1.0/simplyMapBase/hylib/hyCommonSpheroid.cc

${OBJECTDIR}/_ext/1136725908/hyImagePosition.o: ../../StoRM-1.0/simplyMapBase/hylib/hyImagePosition.cc 
	${MKDIR} -p ${OBJECTDIR}/_ext/1136725908
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1136725908/hyImagePosition.o ../../StoRM-1.0/simplyMapBase/hylib/hyImagePosition.cc

${OBJECTDIR}/_ext/1136725908/hyPolarPosition.o: ../../StoRM-1.0/simplyMapBase/hylib/hyPolarPosition.cc 
	${MKDIR} -p ${OBJECTDIR}/_ext/1136725908
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1136725908/hyPolarPosition.o ../../StoRM-1.0/simplyMapBase/hylib/hyPolarPosition.cc

${OBJECTDIR}/_ext/1136725908/hyProjection.o: ../../StoRM-1.0/simplyMapBase/hylib/hyProjection.cc 
	${MKDIR} -p ${OBJECTDIR}/_ext/1136725908
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1136725908/hyProjection.o ../../StoRM-1.0/simplyMapBase/hylib/hyProjection.cc

${OBJECTDIR}/_ext/1876510455/Exceptions.o: ../../StoRM-1.0/simplyMapBase/rainlib/Exceptions.cc 
	${MKDIR} -p ${OBJECTDIR}/_ext/1876510455
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1876510455/Exceptions.o ../../StoRM-1.0/simplyMapBase/rainlib/Exceptions.cc

${OBJECTDIR}/_ext/1876510455/Log.o: ../../StoRM-1.0/simplyMapBase/rainlib/Log.cc 
	${MKDIR} -p ${OBJECTDIR}/_ext/1876510455
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1876510455/Log.o ../../StoRM-1.0/simplyMapBase/rainlib/Log.cc

${OBJECTDIR}/_ext/1876510455/Mutex.o: ../../StoRM-1.0/simplyMapBase/rainlib/Mutex.cc 
	${MKDIR} -p ${OBJECTDIR}/_ext/1876510455
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1876510455/Mutex.o ../../StoRM-1.0/simplyMapBase/rainlib/Mutex.cc

${OBJECTDIR}/_ext/565720769/GeneralUtils.o: ../swlib-15/GeneralUtils.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/565720769
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/565720769/GeneralUtils.o ../swlib-15/GeneralUtils.cpp

${OBJECTDIR}/_ext/565720769/hidrus15_params.o: ../swlib-15/hidrus15_params.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/565720769
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/565720769/hidrus15_params.o ../swlib-15/hidrus15_params.cpp

${OBJECTDIR}/_ext/565720769/ncio.o: ../swlib-15/ncio.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/565720769
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/565720769/ncio.o ../swlib-15/ncio.cpp

${OBJECTDIR}/_ext/565720769/stats.o: ../swlib-15/stats.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/565720769
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/565720769/stats.o ../swlib-15/stats.cpp

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/hidrus-2

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
