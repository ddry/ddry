'use strict'

spec = require('ddry/modular')()

spec.apply
  title: 'DDRY modular spec'
  code: 'lib'
  spec: 'spec/lib'
  outside:
    index: 'index'
    modular: 'modular'
  only: [ 'code_module' ]
