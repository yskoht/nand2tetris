p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Not16 := $(addprefix $(p), NotN.v Not16.v)

include ../Not/src.mk
deps_Not16 := $(src_Not)

src_Not16 := $(_src_Not16) $(deps_Not16)
