#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-LPCUSBDK_18F14K50.mk)" "nbproject/Makefile-local-LPCUSBDK_18F14K50.mk"
include nbproject/Makefile-local-LPCUSBDK_18F14K50.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=LPCUSBDK_18F14K50
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/pic-morphy-usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/pic-morphy-usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=./framework/usb/src/usb_device.c ./usb_descriptors.c ./framework/usb/src/usb_device_hid.c ./usb_events.c ./main.c system.c ./app_device_custom_hid.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/framework/usb/src/usb_device.p1 ${OBJECTDIR}/usb_descriptors.p1 ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1 ${OBJECTDIR}/usb_events.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/system.p1 ${OBJECTDIR}/app_device_custom_hid.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/framework/usb/src/usb_device.p1.d ${OBJECTDIR}/usb_descriptors.p1.d ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1.d ${OBJECTDIR}/usb_events.p1.d ${OBJECTDIR}/main.p1.d ${OBJECTDIR}/system.p1.d ${OBJECTDIR}/app_device_custom_hid.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/framework/usb/src/usb_device.p1 ${OBJECTDIR}/usb_descriptors.p1 ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1 ${OBJECTDIR}/usb_events.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/system.p1 ${OBJECTDIR}/app_device_custom_hid.p1

# Source Files
SOURCEFILES=./framework/usb/src/usb_device.c ./usb_descriptors.c ./framework/usb/src/usb_device_hid.c ./usb_events.c ./main.c system.c ./app_device_custom_hid.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-LPCUSBDK_18F14K50.mk dist/${CND_CONF}/${IMAGE_TYPE}/pic-morphy-usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F14K50
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/framework/usb/src/usb_device.p1: ./framework/usb/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/usb/src" 
	@${RM} ${OBJECTDIR}/framework/usb/src/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/framework/usb/src/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/framework/usb/src/usb_device.p1 ./framework/usb/src/usb_device.c 
	@${FIXDEPS} ${OBJECTDIR}/framework/usb/src/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/usb_descriptors.p1: ./usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/usb_descriptors.p1 ./usb_descriptors.c 
	@${FIXDEPS} ${OBJECTDIR}/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/framework/usb/src/usb_device_hid.p1: ./framework/usb/src/usb_device_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/usb/src" 
	@${RM} ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1.d 
	@${RM} ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1 ./framework/usb/src/usb_device_hid.c 
	@${FIXDEPS} ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/usb_events.p1: ./usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/usb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/usb_events.p1 ./usb_events.c 
	@${FIXDEPS} ${OBJECTDIR}/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: ./main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/main.p1 ./main.c 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/system.p1 system.c 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/app_device_custom_hid.p1: ./app_device_custom_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/app_device_custom_hid.p1.d 
	@${RM} ${OBJECTDIR}/app_device_custom_hid.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/app_device_custom_hid.p1 ./app_device_custom_hid.c 
	@${FIXDEPS} ${OBJECTDIR}/app_device_custom_hid.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/framework/usb/src/usb_device.p1: ./framework/usb/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/usb/src" 
	@${RM} ${OBJECTDIR}/framework/usb/src/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/framework/usb/src/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/framework/usb/src/usb_device.p1 ./framework/usb/src/usb_device.c 
	@${FIXDEPS} ${OBJECTDIR}/framework/usb/src/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/usb_descriptors.p1: ./usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/usb_descriptors.p1 ./usb_descriptors.c 
	@${FIXDEPS} ${OBJECTDIR}/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/framework/usb/src/usb_device_hid.p1: ./framework/usb/src/usb_device_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/framework/usb/src" 
	@${RM} ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1.d 
	@${RM} ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1 ./framework/usb/src/usb_device_hid.c 
	@${FIXDEPS} ${OBJECTDIR}/framework/usb/src/usb_device_hid.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/usb_events.p1: ./usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/usb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/usb_events.p1 ./usb_events.c 
	@${FIXDEPS} ${OBJECTDIR}/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: ./main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/main.p1 ./main.c 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/system.p1: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.p1.d 
	@${RM} ${OBJECTDIR}/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/system.p1 system.c 
	@${FIXDEPS} ${OBJECTDIR}/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/app_device_custom_hid.p1: ./app_device_custom_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/app_device_custom_hid.p1.d 
	@${RM} ${OBJECTDIR}/app_device_custom_hid.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/app_device_custom_hid.p1 ./app_device_custom_hid.c 
	@${FIXDEPS} ${OBJECTDIR}/app_device_custom_hid.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/pic-morphy-usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/pic-morphy-usb.x.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     --rom=default,-3e70-3fff   $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/pic-morphy-usb.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/pic-morphy-usb.x.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/pic-morphy-usb.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/pic-morphy-usb.x.${IMAGE_TYPE}.map  -DXPRJ_LPCUSBDK_18F14K50=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"./framework/usb/inc" -I"." -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c90 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/pic-morphy-usb.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/LPCUSBDK_18F14K50
	${RM} -r dist/LPCUSBDK_18F14K50

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
