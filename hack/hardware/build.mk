source := $(sort $(src) $(test_bench))
top_module := $(test_bench:.v=)

.PHONY: build
build:
	iverilog -o main -s $(top_module) $(source)

.PHONY: run
run:
	vvp main

.PHONY: view
view:
	open -a gtkwave.app dump.vcd

.PHONY: diff
diff:
	diff output.txt exp.txt

.PHONY: out
out:
	cat output.txt

.PHONY: test
test: build run diff

.PHONY: clean
clean:
	rm -rf main dump.vcd output.txt
