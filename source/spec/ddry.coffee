'use strict'

mode = require './mode'

spec = mode.run true,
  title: 'DDRY modular spec'
  code: 'lib'
  spec: 'spec/lib'
  helper:
    path: 'spec/helper'
    initial: [ '../' ]
  outside:
    index: 'index'
    modular: 'modular'
    spec_helper: 'spec/helper'
  initial:
    spec_helper: [ '../' ]
  moduleTitles:
    code_module: 'Code module processing core'
    code_module_errors: 'Code module processing error handling'
    code_module_types: 'Code module types processing'
    construct: 'Instance constructor'
    error_report: 'Error reporter'
    require_safe: 'Safe require wrapper'
    spec_helper: 'Spec helper spec'
  only: [
    'code_module'
    'code_module_errors'
    'code_module_types'
    'construct'
    'error_report'
    'require_safe'
    'spec_helper'
  ]
