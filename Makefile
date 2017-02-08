.PHONY: co mo mocha tape test

co:
	coffee -co . source/ddry &&\
	coffee -co spec source/spec

mocha:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/ddry.js \
		--check-leaks

tape:
	tape spec/ddry.js | node_modules/.bin/tap-spec

mo: co mocha

ta: co tape

test: mocha tape
