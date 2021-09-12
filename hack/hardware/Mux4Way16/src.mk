p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Mux4Way16 := $(addprefix $(p), Mux4WayN.v Mux4Way16.v)

include ../Mux16/src.mk
deps_Mux4Way16 := $(src_Mux16)

src_Mux4Way16 := $(_src_Mux4Way16) $(deps_Mux4Way16)
