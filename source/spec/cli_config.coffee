'use strict'

run_cli = require './run_cli'
initial = require './initial'

expand =
  d: 'ddry'
  e: 'edge'
  n: 'npmv'

module.exports = (short) ->
  [ shortHarness, shortSubject ] = short
  harness = expand[shortHarness]
  subject = expand[shortSubject]
  run_cli harness, subject,
    title: "#{subject} by #{harness}"
    matchers: 'ddry-selenium-matchers'
    initial: initial
    use: 'examples.selenium'
    harness:
      tap:
        except: 'examples.selenium'
    except: [
      'fs.require_safe_core'
      'fs.folder'
      'matchers.get_actual'
      'modular_wrapper'
      'spec.runner.index'
      'test.outputs'
      'test.tap'
      'test.tap_spec'
    ]
