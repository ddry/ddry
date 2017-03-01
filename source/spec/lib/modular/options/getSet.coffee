'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      @.moduleName = 'name'
      @.params = {}
    it: "returns false if set option is not specified"
    i: [ 'use' ]
    e: false
  ,
    before: ->
      @.params =
        use: [ 'noname', 'allname' ]
    it: "determines if name is not listed in set option"
    i: [ 'use' ]
    e: false
  ,
    before: ->
      @.params =
        use: [ 'name', 'noname', 'allname' ]
    it: "determines if name is listed in set option"
    i: [ 'use' ]
    e: true
  ]
