p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_RAM8Kp2 := $(addprefix $(p), RAM8Kp2.v)

include ../RAMp2/src.mk
deps_RAM8Kp2 := $(src_RAMp2)

src_RAM8Kp2 := $(_src_RAM8Kp2) $(deps_RAM8Kp2)
