p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Or8Way := $(addprefix $(p), OrNWay.v Or8Way.v)

include ../Or/src.mk
deps_Or8Way := $(src_Or)

src_Or8Way := $(_src_Or8Way) $(deps_Or8Way)
