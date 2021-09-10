p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_DMux4Way := $(addprefix $(p), DMux4Way.v)

include ../DMux/src.mk
deps_DMux4Way := $(src_DMux)

src_DMux4Way := $(_src_DMux4Way) $(deps_DMux4Way)
