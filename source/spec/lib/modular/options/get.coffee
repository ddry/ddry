'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      @.moduleName = 'mildly.deepened.module'
      @.params = {}
    it: 'returns false if options is not set'
    i: [ 'option' ]
    e: false
  ,
    before: ->
      @.moduleName = 'mildly.deepened.module'
      @.params =
        option:
          mildly: 'value'
    it: 'returns false if module name is not traceable in option'
    i: [ 'option' ]
    e: false
  ,
    before: ->
      @.moduleName = 'mildly.deepened.module'
      @.params =
        option:
          mildly: 
            deepened:
              otherModule: 'value'
    it: 'returns false if module name is not set for module'
    i: [ 'option' ]
    e: false
  ,
    before: ->
      @.moduleName = 'mildly.deepened.module'
      @.params =
        option:
          mildly: 
            deepened:
              module: 'value'
    it: 'returns option specific to given module'
    i: [ 'option' ]
    e: 'value'
  ]
