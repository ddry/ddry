'use strict'

helper = require './spec_helper'

spec = helper.run true,
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
    code_module_types: 'Code module types processing'
    require_safe: 'Safe require wrapper'
    spec_helper: 'Spec helper spec'
  only: [
    'code_module'
    'code_module_errors'
    'code_module_types'
    'error_report'
    'require_safe'
    'spec_helper'
  ]
