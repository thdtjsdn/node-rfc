# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := rfc
DEFS_Debug := \
	'-DNODE_GYP_MODULE_NAME=rfc' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DSAPwithUNICODE' \
	'-DSAPwithTHREADS' \
	'-DNDEBUG' \
	'-DSAPonLIN' \
	'-DSAPonUNIX' \
	'-D__NO_MATH_INLINES' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions

INCS_Debug := \
	-I/home/pos/.node-gyp/0.12.7/src \
	-I/home/pos/.node-gyp/0.12.7/deps/uv/include \
	-I/home/pos/.node-gyp/0.12.7/deps/v8/include \
	-I$(SAPNWRFC_HOME)/include

DEFS_Release := \
	'-DNODE_GYP_MODULE_NAME=rfc' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DSAPwithUNICODE' \
	'-DSAPwithTHREADS' \
	'-DNDEBUG' \
	'-DSAPonLIN' \
	'-DSAPonUNIX' \
	'-D__NO_MATH_INLINES' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-O3 \
	-ffunction-sections \
	-fdata-sections \
	-fno-tree-vrp \
	-fno-tree-sink \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions

INCS_Release := \
	-I/home/pos/.node-gyp/0.12.7/src \
	-I/home/pos/.node-gyp/0.12.7/deps/uv/include \
	-I/home/pos/.node-gyp/0.12.7/deps/v8/include \
	-I$(SAPNWRFC_HOME)/include

OBJS := \
	$(obj).target/$(TARGET)/src/rfc.o \
	$(obj).target/$(TARGET)/src/error.o \
	$(obj).target/$(TARGET)/src/rfcio.o \
	$(obj).target/$(TARGET)/src/Client.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64

LIBS := \
	-L$(SAPNWRFC_HOME)/lib \
	-lsapnwrfc \
	-lsapucum

linux_x64/rfc.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
linux_x64/rfc.node: LIBS := $(LIBS)
linux_x64/rfc.node: TOOLSET := $(TOOLSET)
linux_x64/rfc.node: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += linux_x64/rfc.node
# Add target alias
.PHONY: rfc
rfc: $(builddir)/rfc.node

# Copy this to the executable output path.
$(builddir)/rfc.node: TOOLSET := $(TOOLSET)
$(builddir)/rfc.node: linux_x64/rfc.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/rfc.node
# Short alias for building this executable.
.PHONY: rfc.node
rfc.node: linux_x64/rfc.node $(builddir)/rfc.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/rfc.node

