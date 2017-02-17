'use strict'

module.exports = (dd, that) ->
  dd.context "With few set to 2", ->
    dd.drive [
      before: ->
        that.few = 2
      it: "Says 'hihi' thrice"
      i: []
      e: 'hihihihihihi'
    ,
      it: "Says 'blahblah' thrice"
      i: [ 'blah' ]
      e: 'blahblahblahblahblahblah'
    ]
  dd.context "With few set to 3", ->
    dd.drive [
      before: ->
        that.few = 3
      it: "Says 'hihihi' thrice"
      i: []
      e: 'hihihihihihihihihi'
    ,
      it: "Says 'blahblahblah' thrice"
      i: [ 'blah' ]
      e: 'blahblahblahblahblahblahblahblahblah'
    ]
  dd.context "With few set again to 2", ->
    dd.drive [
      before: ->
        that.few = 2
      it: "Says 'hihi' thrice"
      i: []
      e: 'hihihihihihi'
    ,
      it: "Says 'blahblah' thrice"
      i: [ 'blah' ]
      e: 'blahblahblahblahblahblah'
    ]
