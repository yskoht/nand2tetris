p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_DMux := $(addprefix $(p), DMux.v)

include ../And/src.mk
include ../Not/src.mk
deps_DMux := $(src_And) $(src_Not)

src_DMux := $(_src_DMux) $(deps_DMux)
