targets := $(shell find . -type d -mindepth 1)

.PHONY: test
test:
	@for target in $(targets); do \
		echo '==='; \
		echo $$target; \
		(cd $$target && make test); \
		echo; \
	done

.PHONY: clean
clean:
	@for target in $(targets); do \
		(cd $$target && make clean); \
	done
