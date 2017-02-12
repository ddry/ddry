'use strict'

module.exports = (dd, that) ->
  context "With few set to 2", ->
    before ->
      that.few = 2
    dd.drive [
      it: "Says 'hihi' once"
      i: []
      e: 'hihi'
    ,
      it: "Says 'blahblah' once"
      i: [ 'blah' ]
      e: 'blahblah'
    ]
  context "With few set to 3", ->
    before ->
      that.few = 3
    dd.drive [
      it: "Says 'hihihi' once"
      i: []
      e: 'hihihi'
    ,
      it: "Says 'blahblahblah' once"
      i: [ 'blah' ]
      e: 'blahblahblah'
    ]
  context "With few set again to 2", ->
    before ->
      that.few = 2
    dd.drive [
      it: "Says 'hihi' once"
      i: []
      e: 'hihi'
    ,
      it: "Says 'blahblah' once"
      i: [ 'blah' ]
      e: 'blahblah'
    ]
