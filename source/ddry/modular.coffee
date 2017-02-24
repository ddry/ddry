'use strict'

object = require './lib/common/object'
DataDriven = require './index'
dd = new DataDriven()

module.exports = (config = {}) ->
  config: config
  dd: dd

  setPrefix: (prefix) ->
    @.dd.module
      prefix: prefix

  apply: (constraints = {}) ->
    jobConfig = object.merge @.config, constraints
    @.dd.modular jobConfig
