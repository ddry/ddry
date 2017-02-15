'use strict'

module.exports = (dd) ->
  dd.drive [
    it: "returns false if set option is not specified"
    i: [ 'use', {}, 'name' ]
    e: false
  ,
    it: "determines if name is not listed in set option"
    i: [ 'use',
      use: [ 'noname', 'allname' ]
    , 'name' ]
    e: false
  ,
    it: "determines if name is listed in set option"
    i: [ 'use',
      use: [ 'name', 'noname', 'allname' ]
    , 'name' ]
    e: true
  ]
