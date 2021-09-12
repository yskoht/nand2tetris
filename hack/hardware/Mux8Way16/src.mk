p := $(dir $(lastword $(MAKEFILE_LIST)))
_src_Mux8Way16 := $(addprefix $(p), Mux8WayN.v Mux8Way16.v)

include ../Mux4Way16/src.mk
deps_Mux8Way16 := $(src_Mux4Way16)

src_Mux8Way16 := $(_src_Mux8Way16) $(deps_Mux8Way16)
