'use strict'

module.exports = (dd, that) ->
  context "With few set to 2", ->
    before ->
      that.few = 2
    dd.drive [
      it: "Says 'hihi' twice"
      i: []
      e: 'hihihihi'
    ,
      it: "Says 'blahblah' twice"
      i: [ 'blah' ]
      e: 'blahblahblahblah'
    ]
  context "With few set to 3", ->
    before ->
      that.few = 3
    dd.drive [
      it: "Says 'hihihi' twice"
      i: []
      e: 'hihihihihihi'
    ,
      it: "Says 'blahblahblah' twice"
      i: [ 'blah' ]
      e: 'blahblahblahblahblahblah'
    ]
  context "With few set again to 2", ->
    before ->
      that.few = 2
    dd.drive [
      it: "Says 'hihi' twice"
      i: []
      e: 'hihihihi'
    ,
      it: "Says 'blahblah' twice"
      i: [ 'blah' ]
      e: 'blahblahblahblah'
    ]
