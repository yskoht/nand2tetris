targets := `find . -type d -mindepth 1`

.PHONY: test
test:
	@for target in $(targets); do \
		(cd $$target && make && make run && make diff); \
	done

.PHONY: clean
clean:
	@for target in $(targets); do \
		(cd $$target && make clean); \
	done
