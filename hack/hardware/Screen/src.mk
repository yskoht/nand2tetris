p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Screen := $(addprefix $(p), Screen.v VGASyncGen.v)

include ../RAM8Kp2/src.mk
deps_Screen := $(src_RAM8Kp2)

src_Screen := $(_src_Screen) $(deps_Screen)
