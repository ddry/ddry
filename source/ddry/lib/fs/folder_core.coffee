'use strict'

fs = require 'fs'
path = require 'path'

module.exports =
  errors:
    order: [ 'pathError', 'folderEmpty' ]
    detectors:
      pathError: (title, path, files) ->
        return [ title, files ] if typeof files is 'string'
        false
      folderEmpty: (title, path, files) ->
        return [ title, path ] unless files.length
        false
    messages:
      pathError: (title, path) ->
        title: "Module '#{title}' folder missing"
        messages: [ "Directory '#{path}' does not exist." ]
      folderEmpty: (title, path) ->
        title: "Module '#{title}' folder empty"
        messages: [ "No files found in '#{path}'." ]

  isFolder: (dir) ->
    try
      folder = fs.statSync(path.join dir).isDirectory()
    catch e
      folder = false
    folder

  getFiles: (dir, recursive) ->
    _ = if recursive
    then @.getFilesRecursively dir
    else fs.readdirSync(dir).filter (file) ->
      fs.statSync(path.join dir, file).isFile()

  getFilesRecursively: (dir) ->
    files = @.walkSync dir, []
    _ = files.map (filename) ->
      filename.replace "#{dir}/", ''

  walkSync: (dir, filelist = []) ->
    files = fs.readdirSync dir
    for file in files
      if fs.statSync(path.join(dir, file)).isDirectory()
        filelist = @.walkSync path.join(dir, file), filelist
      else
        filelist.push path.join(dir, file)
    filelist

  getDir: (dir) ->
    return dir if fs.existsSync dir
    "node_modules/#{dir}"
