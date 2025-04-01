.PHONY: all test

all:
	./rebar3 compile

test:
	./rebar3 eunit

clean:
	rm -rf _build
