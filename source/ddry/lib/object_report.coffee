'use strict'

helpers = require './object_report_helpers'

module.exports = (value) ->
    return helpers.create value if helpers.validObject value
    helpers.format value
