'use strict'

module.exports = (dd, that) ->
  before 'Setting initial value', ->
    that.container = ''
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
