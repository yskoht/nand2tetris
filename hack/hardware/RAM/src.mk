p := $(dir $(lastword $(MAKEFILE_LIST)))
src_RAM := $(addprefix $(p), RAM.v)
