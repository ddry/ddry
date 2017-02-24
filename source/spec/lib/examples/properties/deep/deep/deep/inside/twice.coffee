'use strict'

module.exports = (dd) ->
  dd.context "With few set to 2", ->
    dd.drive [
      before: ->
        @.few = 2
      it: "Says 'hihi' twice"
      i: []
      e: 'hihihihi'
    ,
      it: "Says 'blahblah' twice"
      i: [ 'blah' ]
      e: 'blahblahblahblah'
    ]
  dd.context "With few set to 3", ->
    dd.drive [
      before: ->
        @.few = 3
      it: "Says 'hihihi' twice"
      i: []
      e: 'hihihihihihi'
    ,
      it: "Says 'blahblahblah' twice"
      i: [ 'blah' ]
      e: 'blahblahblahblahblahblah'
    ]
  dd.context "With few set again to 2", ->
    dd.drive [
      before: ->
        @.few = 2
      it: "Says 'hihi' twice"
      i: []
      e: 'hihihihi'
    ,
      it: "Says 'blahblah' twice"
      i: [ 'blah' ]
      e: 'blahblahblahblah'
      after: ->
        delete @.few
    ]
