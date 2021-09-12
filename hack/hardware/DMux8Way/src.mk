p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_DMux8Way := $(addprefix $(p), DMux8Way.v)

include ../DMux4Way/src.mk
include ../DMux/src.mk
deps_DMux8Way := $(src_DMux4Way) $(src_DMux)

src_DMux8Way := $(_src_DMux8Way) $(deps_DMux8Way)
