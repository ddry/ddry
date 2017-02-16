'use strict'

module.exports = (dd, that) ->
  that.moduleName = 'name'
  dd.drive [
    before: ->
      that.params = {}
    it: "returns false if set option is not specified"
    i: [ 'use' ]
    e: false
  ,
    before: ->
      that.params =
        use: [ 'noname', 'allname' ]
    it: "determines if name is not listed in set option"
    i: [ 'use' ]
    e: false
  ,
    before: ->
      that.params =
        use: [ 'name', 'noname', 'allname' ]
    it: "determines if name is listed in set option"
    i: [ 'use' ]
    e: true
  ]
