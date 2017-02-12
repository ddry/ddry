'use strict'

helper = require '../../spec_helper'

module.exports = (dd) ->
  ddryWithModule = helper.dd()
  ddryWithModule.modular
    spec: 'spec/examples/spec/module_and_driver'
    outside:
      module: 'spec/examples/code/lib/numbering'

  dd.drive
    it: 'returns stored module singleton'
    i: [ ddryWithModule, 'set' ]
    e: helper.requireSafe 'spec/examples/code/lib/numbering'

  ddryWithDriver = helper.dd()
  ddryWithDriver.modular
    spec: 'spec/examples/spec/module_and_driver'
    outside:
      driver: 'spec/examples/code/lib/instance'
    use: [ 'driver' ]

  Driver = helper.requireSafe 'spec/examples/code/lib/instance'

  dd.drive
    it: 'returns driver instance'
    i: [ ddryWithDriver, 'spec' ]
    e: new Driver()
