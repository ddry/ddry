.PHONY: all ddry edge npmv c- ce- cleanup coveralls m- mo mocha s- t- te- tap tape test travis

all: ddry edge npmv

ddry: s-de s-dn

edge: s-ed s-en

npmv: s-nd s-ne

cleanup:
	rm -rf edge lib spec

c- c-%:
	make cleanup
	coffee -c$*o . source/ddry & \
	coffee -c$*o spec source/spec

ce- ce-%:
	make cleanup
	coffee -c$*o . source/ddry & \
	coffee -c$*o edge source/ddry & \
	coffee -c$*o spec source/spec

coveralls:
	istanbul cover ./node_modules/mocha/bin/_mocha spec/ddry.js --report lcovonly -- -R spec && cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js && rm -rf ./coverage

m- m-%:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/modes/$*.js \
		--check-leaks

mocha:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/ddry.js \
		--check-leaks

s- s-%:
	make m-$* te-$* t-$*

t- t-%:
	node_modules/.bin/tap spec/modes/$*.js

te- te-%:
	tape spec/modes/$*.js | grep -v 'muteTape' | node_modules/.bin/tap-spec 

tap:
	node_modules/.bin/tap spec/ddry.js

tape:
	tape spec/ddry.js | grep -v 'muteTape' | node_modules/.bin/tap-spec

test: mocha tape tap

travis:
	make tape tap coveralls
