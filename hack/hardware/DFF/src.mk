p := $(dir $(lastword $(MAKEFILE_LIST)))
src_DFF := $(addprefix $(p), DFF.v)
