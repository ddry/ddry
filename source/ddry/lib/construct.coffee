'use strict'

module.exports = (constructor, args) ->
  F = ->
    constructor.apply(this, args);
  F.prototype = constructor.prototype;
  new F()
