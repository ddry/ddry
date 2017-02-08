'use strict'

DataDriven = require 'ddry'
spec = new DataDriven()

spec.modular
  title: 'DDRY modular spec'
  code: 'lib'
  spec: 'spec/lib'
  outside:
    index: 'index'
    modular: 'modular'
  only: [ 'code_module' ]
