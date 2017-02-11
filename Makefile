.PHONY: co coveralls mo mocha ta tape test

co:
	coffee -co . source/ddry &&\
	coffee -co spec source/spec

coveralls:
	istanbul cover ./node_modules/mocha/bin/_mocha spec/ddry.js --report lcovonly -- -R spec && cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js && rm -rf ./coverage

mo: co mocha

mocha:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/ddry.js \
		--check-leaks

ta: co tape

tape:
	tape spec/ddry.js | node_modules/.bin/tap-spec

test: co mocha tape
