'use strict'

common = require './lib/common'
DataDriven = require './index'
dd = new DataDriven()

module.exports = (config = {}) ->
  config: config
  dd: dd

  setPrefix: (prefix) ->
    @.dd.module
      prefix: prefix

  apply: (constraints = {}) ->
    jobConfig = common.mergeObjects @.config, constraints
    @.dd.modular jobConfig
