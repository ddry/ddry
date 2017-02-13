'use strict'

module.exports = (dd) ->
  ddryWithModule = dd.helper.ddry()
  ddryWithModule.modular
    outside:
      module: 'spec/examples/code/lib/numbering'

  dd.drive
    it: 'returns stored module singleton'
    i: [ ddryWithModule, 'set' ]
    e: dd.helper.requireSafe 'spec/examples/code/lib/numbering'

  ddryWithDriver = dd.helper.ddry()
  ddryWithDriver.modular
    outside:
      driver: 'spec/examples/code/lib/instance'
    use: [ 'driver' ]

  Driver = dd.helper.requireSafe 'spec/examples/code/lib/instance'

  dd.drive
    it: 'returns driver instance'
    i: [ ddryWithDriver, 'spec' ]
    e: new Driver()
