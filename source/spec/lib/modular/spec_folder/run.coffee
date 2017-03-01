'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()

  dd.drive
    it: 'runs module spec folder'
    i: [ ddry, '', {}, false ]
    e: true
