'use strict'

spec = require('../../modular')()
spec.setPrefix '../'

spec.apply
  title: 'Examples'
  code: 'spec/examples/code/lib'
  spec: 'spec/examples/spec/lib'
  initial:
    instance: [ 'title', 'message' ]
  except: [ 'numbering_rewrite' ]
