'use strict'

module.exports = (dd, that) ->
  context "With few set to 2", ->
    before ->
      that.few = 2
    dd.drive [
      it: "Says 'hihi' thrice"
      i: []
      e: 'hihihihihihi'
    ,
      it: "Says 'blahblah' thrice"
      i: [ 'blah' ]
      e: 'blahblahblahblahblahblah'
    ]
  context "With few set to 3", ->
    before ->
      that.few = 3
    dd.drive [
      it: "Says 'hihihi' thrice"
      i: []
      e: 'hihihihihihihihihi'
    ,
      it: "Says 'blahblahblah' thrice"
      i: [ 'blah' ]
      e: 'blahblahblahblahblahblahblahblahblah'
    ]
  context "With few set again to 2", ->
    before ->
      that.few = 2
    dd.drive [
      it: "Says 'hihi' thrice"
      i: []
      e: 'hihihihihihi'
    ,
      it: "Says 'blahblah' thrice"
      i: [ 'blah' ]
      e: 'blahblahblahblahblahblah'
    ]
