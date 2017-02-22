'use strict'

core = require './folder_core'
errorReport = require '../common/error_report'

module.exports =
  isFolder: core.isFolder

  read: (title, dir, recursive) ->
    dir = core.getDir dir
    try
      files = core.getFiles dir, recursive
    catch e
      files = dir
    return false if errorReport.toTestEngine core.errors, [ title, dir, files ]
    files = files.map (filename) ->
      [method, ...] = filename.split '.'
      method
    names = files.map (filePath) ->
      filePath.split('/').join '.'
    files = files.map (filename) ->
      "#{dir}/#{filename}"
    methodList = {}
    for i in [0..names.length - 1]
      methodList[names[i]] = files[i]
    methodList
