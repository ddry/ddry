.PHONY: all ddry edge npmv c- coveralls m- mo mocha s- t- ta tape test

all: ddry edge npmv

ddry: s-de s-dn

edge: s-ed s-en

npmv: s-nd s-ne

c- c-%:
	coffee -c$*o . source/ddry & \
	coffee -c$*o spec source/spec

coveralls:
	istanbul cover ./node_modules/mocha/bin/_mocha spec/ddry.js --report lcovonly -- -R spec && cat ./coverage/lcov.info | ./node_modules/coveralls/bin/coveralls.js && rm -rf ./coverage

m- m-%:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/modes/$*.js \
		--check-leaks

mo: c- mocha

mocha:
	./node_modules/.bin/mocha \
		--no-exit \
		spec/ddry.js \
		--check-leaks

s- s-%:
	make m-$* t-$*

t- t-%:
	tape spec/modes/$*.js | grep -v 'muteTape' | node_modules/.bin/tap-spec 

ta: c- tape

tape:
	tape spec/ddry.js | grep -v 'muteTape' | node_modules/.bin/tap-spec

test: c- mocha tape
