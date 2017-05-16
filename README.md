# ddry

[![Build Status](https://travis-ci.org/ddry/ddry.svg?branch=master)](https://travis-ci.org/ddry/ddry) [![Coverage Status](https://coveralls.io/repos/github/ddry/ddry/badge.svg?branch=master)](https://coveralls.io/github/ddry/ddry?branch=master)

<img src="https://cloud.githubusercontent.com/assets/5163953/22628172/6b91f120-ebe0-11e6-8456-0f5b2dc3a553.png" alt="ddry logo" width="250">

Data-driven DRY wrapper for Node JS testing. Supports Mocha, Tape and Selenium Webdriver

### Brief introduction

ddry (Data-Driven Don't Repeat Yourself) JS testing wrapper is made to remove all the error-prone code clutter from testing.

Developers should not be distracted by `require`ing target code modules for testing or assertion libraries or even — please just read it carefully — debugging test suites. Testing appears to be more about validating data processing performed by tested modules methods, not about code you need to write to test some other code.

Well, we already have our code modules structure. Why invent their specs structure with messy `require`ing?

With ddry you simply _(convention-over-configuration)_ organize your spec folder similar to your code folder, where module spec folder structure resembles module properties and methods structure, and in `spec/someFolder/someModule/someMethod.js` file you have the context of `someMethod` of `someModule` without any requiring — [ddry](https://www.npmjs.com/package/ddry) does it for you seamlessly and transparently. Then in this way placed file

_(here and further we use `coffee` for its awesome object syntax)_

```coffee
'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'does everything correctly'
    i: [ 'arguments', 'a', 'method', 'receives' ]
    e: 'value it returns'
  ]
```

And that's it. `i` is for input, `e` is for expected. Let's keep focused on data flow. Pray excuse me who think that `require`, `assert`, `expect` etc. are the essence of testing.

This data-driven code will be adapted and passed by [ddry](https://www.npmjs.com/package/ddry) to any of three JS test harnesses: [Mocha JS](https://www.npmjs.com/package/mocha), [TAP](https://www.npmjs.com/package/tap) or [Tape JS](https://www.npmjs.com/package/tape) to perform actual testing. [ddry](https://www.npmjs.com/package/ddry) itself is fully covered on all of them with unified harness-agnostic codebase.

And yet every **ddry** spec remains conventional JS module where you can write your JS the way you like.

```coffee
# spec/someFolder/someModule/someMethod.coffee

###
# Module title recognizable by `ddry titles` command
###

'use strict'

module.exports = (dd, that) -> # `dd` is ddry instance, `that` is someModule
  method = that.someMethod

  # testing context creation omitted

  actual = method 'arguments', 'a', 'method', 'receives'
  dd.drive
    matcher: 'plain'
    it: 'does everything correctly'
    i: actual
    e: 'value it returns'
    
  # cleanup omitted
```

is, of course, possible. And, of course, you can `require` whatever assertion instruments you need and use them. And, of course, whatever you can do with JS.

Also [ddry](https://www.npmjs.com/package/ddry) has:
- cross-harness features: context, before/after hooks and x-style skipping and mass-skipping;
- powerful default matchers set including `plain`, `contains` and `error` and easy custom matchers adding;
- spec sequence syntax allowing to use one setting through multiple specs;
- convention-over-configuration folder-style module instances support;
- easily configurable instantiable attachable spec helper;
- Selenium Webdriver support (with Mocha only);
- `ddry` shell command to maintain the project spec config file `ddry.json`;
- test harness specific shell commands `ddry-mocha`, `ddry-tap` and `ddry-tape` to comfortly run the specs of your choice against test harness of your choice;
- some cute minor features.

Plainly, a decent set of capabilities to make JS testing easy and even fun.

### ddry command line interface

ddry CLI gives you convenient access to your data-driven specs by
- keeping their config in `ddry.json` file;
- implementing powerful features for maintaining this config file;
- applying **only-except** style suite running scope with one shell command. 

_**Only-except** scoping logic is applicable to modules folders, modules and module methods levels._

In your development environment you may want to get easy access to `ddry` shell command by installing [ddry](https://www.npmjs.com/package/ddry) globally:

```sh
$ sudo npm i -g ddry
```

`ddry` shell command is just a spec configuring tool, it does not perform any actual testing which is task of harness-specific commands as well as spec suite execution scoping.

### Optional dependencies and spec suite execution scoping

**ddry** core just implements javascript.dot.notated.object.syntax to spec/modules/and/folders/and/methods/filenames permutation magic, some cross-harness features and matchers setup. To run actual tests it needs at least one real JS test harness that **ddry** knows about: Mocha JS, TAP, or Tape JS. Here we come to the strange concept of optional dependency.

There are four packages to solve this problem by adding viable `devDependencies` set — **ddry** core and test harness(es) — to `package.json` and implementing harness-specific shell command(s) — `ddry-mocha`, `ddry-tap` and `ddry-tape`:

- [ddry-mocha](https://www.npmjs.com/package/ddry-mocha) for Mocha JS;
- [ddry-tap](https://www.npmjs.com/package/ddry-tape) for TAP;
- [ddry-tape](https://www.npmjs.com/package/ddry-tape) for Tape JS;
- [ddry-mocha-tape](https://www.npmjs.com/package/ddry-mocha-tape) mounting all the supported harnesses.

To run the spec configured by `ddry.json` from within the test harness of your choice just pass to it the `./node_modules/ddry/ddry.js` file. Please check [Makefile](https://github.com/ddry/ddry-mocha-tape/blob/master/Makefile) of any of these packages for examples.

Any of test harness specific shell commands — `ddry-mocha`, `ddry-tap` and `ddry-tape` — without parameters will launch the entire suite configured in `ddry.json` against its test harness.

Use `-e` and `-o` keys for **except** and **only** scoping strategies applied to `tab`-completed code or spec files or folders. Inside code folder you have access to module folders and module level, inside spec folder you may scope method-wise. Keys you use with `ddry-<mocha|tap|tape>` command will have effect only once, while this shell command runs.

To manage permanent scopes in `ddry.json` you may use `$ ddry as` and `$ ddry rs` commands — they will translate to config object style (dot-notated, by the way) your `tab`-completed findings.

Further ddry CLI shell commands usage details are subject of these four packages documentation.

### Getting started with ddry

and

### Data-driven DRY testing wrapper features documentation

are coming here very soon.
