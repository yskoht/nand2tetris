p := $(dir $(lastword $(MAKEFILE_LIST)))
src_ClockGen := $(addprefix $(p), ClockGen.v)
