p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_HalfAdder := $(addprefix $(p), HalfAdder.v)

include ../Xor/src.mk
include ../And/src.mk
deps_HalfAdder := $(src_Xor) $(src_And)

src_HalfAdder := $(_src_HalfAdder) $(deps_HalfAdder)
