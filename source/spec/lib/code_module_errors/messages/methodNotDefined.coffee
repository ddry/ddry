'use strict'

module.exports = (dd, that) ->
  dd.drive
    it: "returns 'methodNotDefined' error message for method of module"
    i: [ 'module', 'methodName' ]
    e:
      title: "Method methodName()"
      messages: [ "is not defined in 'module'" ]
