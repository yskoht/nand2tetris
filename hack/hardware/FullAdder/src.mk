p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_FullAdder := $(addprefix $(p), FullAdder.v)

include ../HalfAdder/src.mk
include ../Or/src.mk
deps_FullAdder := $(src_HalfAdder) $(src_Or)

src_FullAdder := $(_src_FullAdder) $(deps_FullAdder)
