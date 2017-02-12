'use strict'

module.exports = (dd) ->
  dd.drive
    it: "returns 'noModuleContext' error message for method name"
    i: [ 'methodName' ]
    e:
      title: 'No module context set.'
      messages: [ "Nowhere to place method 'methodName'." ]
