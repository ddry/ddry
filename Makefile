.PHONY: c- ce- coveralls mocha ps server- tap tape test travis

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
	ddry.js --report lcovonly -- -R spec && \
	cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js && \
	rm -rf ./coverage

mocha:
	selenium/sh/mocha
	make pjs

pjs:
	selenium/sh/pjs_cleanup

ps:
	selenium/sh/ps_cleanup

server-%:
	rm -rf edge lib spec
	@if [ "$*" = "w" ]; then \
		selenium/sh/server; \
	fi

tap:
	selenium/sh/tap

tape:
	selenium/sh/tape

test: mocha tape tap

travis:
	make tape tap coveralls
