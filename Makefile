.PHONY: c- coveralls mo mocha ta tape test

c- c-%:
	coffee -c$*o . source/ddry & \
	coffee -c$*o edge source/ddry & \
	coffee -c$*o spec source/spec

coveralls:
	istanbul cover ./node_modules/mocha/bin/_mocha spec/ddry.js --report lcovonly -- -R spec && cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js && rm -rf ./coverage

mo: c- mocha

mocha:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/ddry.js \
		--check-leaks

ta: c- tape

tape:
	tape spec/ddry.js | node_modules/.bin/tap-spec

test: c- mocha tape
