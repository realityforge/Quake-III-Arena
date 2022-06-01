# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug_x64
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug_x64)
  RESCOMP = windres
  TARGETDIR = ../../.build/debug_x64
  TARGET = $(TARGETDIR)/liblibjpeg-turbo.a
  OBJDIR = ../../.build/debug_x64/libjpeg-turbo
  DEFINES += -DWITH_SIMD -DSIZEOF_SIZE_T=8 -DDEBUG -D_DEBUG
  INCLUDES += -I../../code/libjpeg-turbo -I../../code/libjpeg-turbo/simd
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g -Wno-unused-parameter -Wno-write-strings -Wno-parentheses -Wno-parentheses-equality 
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS) -fno-exceptions -fno-rtti
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -L../../.build/debug_x64 -m64 
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x64)
  RESCOMP = windres
  TARGETDIR = ../../.build/release_x64
  TARGET = $(TARGETDIR)/liblibjpeg-turbo.a
  OBJDIR = ../../.build/release_x64/libjpeg-turbo
  DEFINES += -DWITH_SIMD -DSIZEOF_SIZE_T=8 -DNDEBUG
  INCLUDES += -I../../code/libjpeg-turbo -I../../code/libjpeg-turbo/simd
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -fomit-frame-pointer -ffast-math -Os -g -msse2 -Wno-unused-parameter -Wno-write-strings -Wno-parentheses -Wno-parentheses-equality -g1
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS) -fno-exceptions -fno-rtti
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -L../../.build/release_x64 -m64 
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/jcapimin.o \
	$(OBJDIR)/jcapistd.o \
	$(OBJDIR)/jccoefct.o \
	$(OBJDIR)/jccolor.o \
	$(OBJDIR)/jcdctmgr.o \
	$(OBJDIR)/jchuff.o \
	$(OBJDIR)/jcinit.o \
	$(OBJDIR)/jcmainct.o \
	$(OBJDIR)/jcmarker.o \
	$(OBJDIR)/jcmaster.o \
	$(OBJDIR)/jcomapi.o \
	$(OBJDIR)/jcparam.o \
	$(OBJDIR)/jcphuff.o \
	$(OBJDIR)/jcprepct.o \
	$(OBJDIR)/jcsample.o \
	$(OBJDIR)/jctrans.o \
	$(OBJDIR)/jdapimin.o \
	$(OBJDIR)/jdapistd.o \
	$(OBJDIR)/jdatadst.o \
	$(OBJDIR)/jdatasrc.o \
	$(OBJDIR)/jdcoefct.o \
	$(OBJDIR)/jdcolor.o \
	$(OBJDIR)/jddctmgr.o \
	$(OBJDIR)/jdhuff.o \
	$(OBJDIR)/jdinput.o \
	$(OBJDIR)/jdmainct.o \
	$(OBJDIR)/jdmarker.o \
	$(OBJDIR)/jdmaster.o \
	$(OBJDIR)/jdmerge.o \
	$(OBJDIR)/jdphuff.o \
	$(OBJDIR)/jdpostct.o \
	$(OBJDIR)/jdsample.o \
	$(OBJDIR)/jdtrans.o \
	$(OBJDIR)/jerror.o \
	$(OBJDIR)/jfdctflt.o \
	$(OBJDIR)/jfdctfst.o \
	$(OBJDIR)/jfdctint.o \
	$(OBJDIR)/jidctflt.o \
	$(OBJDIR)/jidctfst.o \
	$(OBJDIR)/jidctint.o \
	$(OBJDIR)/jidctred.o \
	$(OBJDIR)/jmemmgr.o \
	$(OBJDIR)/jquant1.o \
	$(OBJDIR)/jquant2.o \
	$(OBJDIR)/jutils.o \
	$(OBJDIR)/jsimd_x86_64.o \

RESOURCES := \

CUSTOMFILES := \

ifeq ($(config),debug_x64)
  OBJECTS += \
	../../.build/debug_x64/libjpeg-turbo/jccolor-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jcgray-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jchuff-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jcsample-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jdcolor-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jdmerge-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jdsample-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jfdctflt-sse-64.o \
	../../.build/debug_x64/libjpeg-turbo/jfdctfst-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jfdctint-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jidctflt-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jidctfst-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jidctint-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jidctred-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jquantf-sse2-64.o \
	../../.build/debug_x64/libjpeg-turbo/jquanti-sse2-64.o \

endif

ifeq ($(config),release_x64)
  OBJECTS += \
	../../.build/release_x64/libjpeg-turbo/jccolor-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jcgray-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jchuff-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jcsample-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jdcolor-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jdmerge-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jdsample-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jfdctflt-sse-64.o \
	../../.build/release_x64/libjpeg-turbo/jfdctfst-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jfdctint-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jidctflt-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jidctfst-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jidctint-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jidctred-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jquantf-sse2-64.o \
	../../.build/release_x64/libjpeg-turbo/jquanti-sse2-64.o \

endif

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

$(TARGET): $(GCH) ${CUSTOMFILES} $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking libjpeg-turbo
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning libjpeg-turbo
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CC) -x c-header $(ALL_CFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/jcapimin.o: ../../code/libjpeg-turbo/jcapimin.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcapistd.o: ../../code/libjpeg-turbo/jcapistd.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jccoefct.o: ../../code/libjpeg-turbo/jccoefct.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jccolor.o: ../../code/libjpeg-turbo/jccolor.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcdctmgr.o: ../../code/libjpeg-turbo/jcdctmgr.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jchuff.o: ../../code/libjpeg-turbo/jchuff.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcinit.o: ../../code/libjpeg-turbo/jcinit.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcmainct.o: ../../code/libjpeg-turbo/jcmainct.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcmarker.o: ../../code/libjpeg-turbo/jcmarker.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcmaster.o: ../../code/libjpeg-turbo/jcmaster.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcomapi.o: ../../code/libjpeg-turbo/jcomapi.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcparam.o: ../../code/libjpeg-turbo/jcparam.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcphuff.o: ../../code/libjpeg-turbo/jcphuff.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcprepct.o: ../../code/libjpeg-turbo/jcprepct.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jcsample.o: ../../code/libjpeg-turbo/jcsample.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jctrans.o: ../../code/libjpeg-turbo/jctrans.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdapimin.o: ../../code/libjpeg-turbo/jdapimin.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdapistd.o: ../../code/libjpeg-turbo/jdapistd.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdatadst.o: ../../code/libjpeg-turbo/jdatadst.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdatasrc.o: ../../code/libjpeg-turbo/jdatasrc.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdcoefct.o: ../../code/libjpeg-turbo/jdcoefct.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdcolor.o: ../../code/libjpeg-turbo/jdcolor.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jddctmgr.o: ../../code/libjpeg-turbo/jddctmgr.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdhuff.o: ../../code/libjpeg-turbo/jdhuff.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdinput.o: ../../code/libjpeg-turbo/jdinput.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdmainct.o: ../../code/libjpeg-turbo/jdmainct.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdmarker.o: ../../code/libjpeg-turbo/jdmarker.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdmaster.o: ../../code/libjpeg-turbo/jdmaster.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdmerge.o: ../../code/libjpeg-turbo/jdmerge.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdphuff.o: ../../code/libjpeg-turbo/jdphuff.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdpostct.o: ../../code/libjpeg-turbo/jdpostct.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdsample.o: ../../code/libjpeg-turbo/jdsample.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jdtrans.o: ../../code/libjpeg-turbo/jdtrans.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jerror.o: ../../code/libjpeg-turbo/jerror.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jfdctflt.o: ../../code/libjpeg-turbo/jfdctflt.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jfdctfst.o: ../../code/libjpeg-turbo/jfdctfst.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jfdctint.o: ../../code/libjpeg-turbo/jfdctint.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jidctflt.o: ../../code/libjpeg-turbo/jidctflt.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jidctfst.o: ../../code/libjpeg-turbo/jidctfst.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jidctint.o: ../../code/libjpeg-turbo/jidctint.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jidctred.o: ../../code/libjpeg-turbo/jidctred.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jmemmgr.o: ../../code/libjpeg-turbo/jmemmgr.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jquant1.o: ../../code/libjpeg-turbo/jquant1.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jquant2.o: ../../code/libjpeg-turbo/jquant2.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/jutils.o: ../../code/libjpeg-turbo/jutils.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jccolor-sse2-64.o: ../../code/libjpeg-turbo/simd/jccolor-sse2-64.asm
	@echo "jccolor-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jccolor-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jccolor-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jccolor-sse2-64.o: ../../code/libjpeg-turbo/simd/jccolor-sse2-64.asm
	@echo "jccolor-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jccolor-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jccolor-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jcgray-sse2-64.o: ../../code/libjpeg-turbo/simd/jcgray-sse2-64.asm
	@echo "jcgray-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jcgray-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jcgray-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jcgray-sse2-64.o: ../../code/libjpeg-turbo/simd/jcgray-sse2-64.asm
	@echo "jcgray-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jcgray-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jcgray-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jchuff-sse2-64.o: ../../code/libjpeg-turbo/simd/jchuff-sse2-64.asm
	@echo "jchuff-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jchuff-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jchuff-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jchuff-sse2-64.o: ../../code/libjpeg-turbo/simd/jchuff-sse2-64.asm
	@echo "jchuff-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jchuff-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jchuff-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jcsample-sse2-64.o: ../../code/libjpeg-turbo/simd/jcsample-sse2-64.asm
	@echo "jcsample-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jcsample-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jcsample-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jcsample-sse2-64.o: ../../code/libjpeg-turbo/simd/jcsample-sse2-64.asm
	@echo "jcsample-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jcsample-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jcsample-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jdcolor-sse2-64.o: ../../code/libjpeg-turbo/simd/jdcolor-sse2-64.asm
	@echo "jdcolor-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jdcolor-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jdcolor-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jdcolor-sse2-64.o: ../../code/libjpeg-turbo/simd/jdcolor-sse2-64.asm
	@echo "jdcolor-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jdcolor-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jdcolor-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jdmerge-sse2-64.o: ../../code/libjpeg-turbo/simd/jdmerge-sse2-64.asm
	@echo "jdmerge-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jdmerge-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jdmerge-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jdmerge-sse2-64.o: ../../code/libjpeg-turbo/simd/jdmerge-sse2-64.asm
	@echo "jdmerge-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jdmerge-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jdmerge-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jdsample-sse2-64.o: ../../code/libjpeg-turbo/simd/jdsample-sse2-64.asm
	@echo "jdsample-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jdsample-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jdsample-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jdsample-sse2-64.o: ../../code/libjpeg-turbo/simd/jdsample-sse2-64.asm
	@echo "jdsample-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jdsample-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jdsample-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jfdctflt-sse-64.o: ../../code/libjpeg-turbo/simd/jfdctflt-sse-64.asm
	@echo "jfdctflt-sse-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jfdctflt-sse-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jfdctflt-sse-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jfdctflt-sse-64.o: ../../code/libjpeg-turbo/simd/jfdctflt-sse-64.asm
	@echo "jfdctflt-sse-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jfdctflt-sse-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jfdctflt-sse-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jfdctfst-sse2-64.o: ../../code/libjpeg-turbo/simd/jfdctfst-sse2-64.asm
	@echo "jfdctfst-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jfdctfst-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jfdctfst-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jfdctfst-sse2-64.o: ../../code/libjpeg-turbo/simd/jfdctfst-sse2-64.asm
	@echo "jfdctfst-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jfdctfst-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jfdctfst-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jfdctint-sse2-64.o: ../../code/libjpeg-turbo/simd/jfdctint-sse2-64.asm
	@echo "jfdctint-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jfdctint-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jfdctint-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jfdctint-sse2-64.o: ../../code/libjpeg-turbo/simd/jfdctint-sse2-64.asm
	@echo "jfdctint-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jfdctint-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jfdctint-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jidctflt-sse2-64.o: ../../code/libjpeg-turbo/simd/jidctflt-sse2-64.asm
	@echo "jidctflt-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jidctflt-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jidctflt-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jidctflt-sse2-64.o: ../../code/libjpeg-turbo/simd/jidctflt-sse2-64.asm
	@echo "jidctflt-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jidctflt-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jidctflt-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jidctfst-sse2-64.o: ../../code/libjpeg-turbo/simd/jidctfst-sse2-64.asm
	@echo "jidctfst-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jidctfst-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jidctfst-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jidctfst-sse2-64.o: ../../code/libjpeg-turbo/simd/jidctfst-sse2-64.asm
	@echo "jidctfst-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jidctfst-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jidctfst-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jidctint-sse2-64.o: ../../code/libjpeg-turbo/simd/jidctint-sse2-64.asm
	@echo "jidctint-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jidctint-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jidctint-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jidctint-sse2-64.o: ../../code/libjpeg-turbo/simd/jidctint-sse2-64.asm
	@echo "jidctint-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jidctint-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jidctint-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jidctred-sse2-64.o: ../../code/libjpeg-turbo/simd/jidctred-sse2-64.asm
	@echo "jidctred-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jidctred-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jidctred-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jidctred-sse2-64.o: ../../code/libjpeg-turbo/simd/jidctred-sse2-64.asm
	@echo "jidctred-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jidctred-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jidctred-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jquantf-sse2-64.o: ../../code/libjpeg-turbo/simd/jquantf-sse2-64.asm
	@echo "jquantf-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jquantf-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jquantf-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jquantf-sse2-64.o: ../../code/libjpeg-turbo/simd/jquantf-sse2-64.asm
	@echo "jquantf-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jquantf-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jquantf-sse2-64.asm
endif
ifeq ($(config),debug_x64)
../../.build/debug_x64/libjpeg-turbo/jquanti-sse2-64.o: ../../code/libjpeg-turbo/simd/jquanti-sse2-64.asm
	@echo "jquanti-sse2-64.asm"
	$(SILENT) nasm -o../../.build/debug_x64/libjpeg-turbo/jquanti-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jquanti-sse2-64.asm
endif
ifeq ($(config),release_x64)
../../.build/release_x64/libjpeg-turbo/jquanti-sse2-64.o: ../../code/libjpeg-turbo/simd/jquanti-sse2-64.asm
	@echo "jquanti-sse2-64.asm"
	$(SILENT) nasm -o../../.build/release_x64/libjpeg-turbo/jquanti-sse2-64.o -felf64 -DELF -D__x86_64__ -I../../code/libjpeg-turbo/ -I../../code/libjpeg-turbo/win/ -I../../code/libjpeg-turbo/simd/ ../../code/libjpeg-turbo/simd/jquanti-sse2-64.asm
endif
$(OBJDIR)/jsimd_x86_64.o: ../../code/libjpeg-turbo/simd/jsimd_x86_64.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif