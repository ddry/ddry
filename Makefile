.PHONY: c- ce- coveralls m- mocha ps server- t- te- tap tape test travis

c-%:
	make server-$*
	coffee -c$*o . source/ddry & \
	coffee -c$*o spec source/spec

ce-%:
	make server-$*
	coffee -c$*o . source/ddry & \
	coffee -c$*o edge source/ddry & \
	coffee -c$*o spec source/spec

coveralls:
	./node_modules/.bin/istanbul cover ./node_modules/mocha/bin/_mocha \
	spec/ddry.js --report lcovonly -- -R spec && \
	cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js && \
	rm -rf ./coverage

m-%:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/mocha \
		--no-exit \
		spec/modes/$*.js \
		--check-leaks
	selenium/sh/pjs_cleanup

mocha:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha \
		--no-exit \
		spec/ddry.js \
		--check-leaks
	selenium/sh/pjs_cleanup

ps:
	selenium/sh/ps_cleanup

server-%:
	rm -rf edge lib spec
	@if [ "$*" = "w" ]; then \
		selenium/sh/server; \
	fi

t-%:
	node_modules/.bin/tap spec/modes/$*.js

te-%:
	tape spec/modes/$*.js | grep -v 'muteTape' | node_modules/.bin/tap-spec 

tap:
	node_modules/.bin/tap spec/ddry.js

tape:
	tape spec/ddry.js | grep -v 'muteTape' | node_modules/.bin/tap-spec

test: mocha tape tap

travis:
	make tape tap coveralls
