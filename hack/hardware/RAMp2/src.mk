p := $(dir $(lastword $(MAKEFILE_LIST)))
src_RAMp2 := $(addprefix $(p), RAMp2.v)
