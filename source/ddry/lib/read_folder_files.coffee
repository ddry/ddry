'use strict'

wrapping = require './read_folder_wrapping'

module.exports = (title, path, recursive = false) ->
  wrapping.readFolderFiles title, path, recursive
