'use strict'

fs = require 'fs'
path = require 'path'

console.log process.argv

obj =
  one: 1
  two: 2
  six: 6
json = JSON.stringify obj
filename = path.join 'node_modules/ddry', 'cmd.json'
fs.writeFileSync filename, json, 'utf-8'
