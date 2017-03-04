'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns spec unchanged if no mass pending detected'
    i: [ {}, {} ]
    e: {}
  ,
    it: 'generates pending message and applies it to spec'
    i: [
      it: 'does smth'
    ,
      xit: 0
    ]
    e:
      xit: 'pending: does smth'
      mochaMethod: 'xit'
  ]
