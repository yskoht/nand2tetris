p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Or16 := $(addprefix $(p), OrN.v Or16.v)

include ../Or/src.mk
deps_Or16 := $(src_Or)

src_Or16 := $(_src_Or16) $(deps_Or16)
