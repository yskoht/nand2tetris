p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Register := $(addprefix $(p), Register.v RegisterN.v)

include ../Bit/src.mk
deps_Register := $(src_Bit)

src_Register := $(_src_Register) $(deps_Register)
