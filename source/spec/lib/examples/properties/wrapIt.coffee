'use strict'

module.exports = (dd, that) ->
  if typeof describe is 'function'
    before ->
      that.container = ''
    after ->
      delete that.container
    context "with 'az'", ->
      beforeEach ->
        that.container += 'a'
      afterEach ->
        that.container += 'z'
      context "with 'by'", ->
        beforeEach ->
          that.container += 'b'
        afterEach ->
          that.container += 'y'
        context "with 'cx'", ->
          beforeEach ->
            that.container += 'c'
          afterEach ->
            that.container += 'x'
          dd.drive [
            it: "wraps '1'"
            i: [ 1 ]
            e: 'abc|1|'
          ,
            it: "wraps '1' again"
            i: [ 2 ]
            e: 'abc|1|xyzabc|2|'
          ,
            it: "wraps '1' again and again"
            i: [ 3 ]
            e: 'abc|1|xyzabc|2|xyzabc|3|'
          ]
  else
    that.container = ''
    dd.drive [
      before: ->
        that.container += 'abc'
      after: ->
        that.container += 'xyz'
    ,
      it: "wraps '1'"
      i: [ 1 ]
      e: 'abc|1|'
    ,
      it: "wraps '1' again"
      i: [ 2 ]
      e: 'abc|1|xyzabc|2|'
    ,
      it: "wraps '1' again and again"
      i: [ 3 ]
      e: 'abc|1|xyzabc|2|xyzabc|3|'
      after: ->
        delete that.container
    ]
