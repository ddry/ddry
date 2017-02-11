'use strict'

spec = require('ddry/modular')()

spec.apply
  title: 'DDRY modular spec'
  code: 'lib'
  spec: 'spec/lib'
  outside:
    index: 'index'
    modular: 'modular'
    spec_helper: 'spec/spec_helper'
  moduleTitles:
    code_module: 'Code module processing core'
    code_module_errors: 'Code module processing error handling'
    require_safe: 'Safe require wrapper'
    spec_helper: 'Spec helper spec'
  only: [
    'code_module'
    'code_module_errors'
    'require_safe'
    'spec_helper'
  ]
