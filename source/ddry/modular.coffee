'use strict'

DataDriven = require './index'
dd = new DataDriven()

module.exports = (config = {}) ->
  config: config
  dd: dd

  setPrefix: (prefix) ->
    @.dd.module
      prefix: prefix

  apply: (constraints = {}) ->
    jobConfig = @.compose constraints
    @.dd.modular jobConfig

  compose: (constraints) ->
    jobConfig = @.config
    for key, value of constraints
      jobConfig[key] = value
    jobConfig
