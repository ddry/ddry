// Generated by CoffeeScript 1.12.6
(function() {
  'use strict';
  module.exports = function(dd) {
    return dd.drive([
      {
        it: 'adds scope to config file',
        i: [{}, '-o', 'spec/examples/code/', '-e', 'spec/lib/examples/selenium', 'spec/lib/examples/properties/wrapIt.js'],
        e: {
          only: ['examples'],
          except: ['examples.selenium'],
          methods: {
            examples: {
              properties: {
                except: ['wrapIt']
              }
            }
          }
        }
      }
    ]);
  };

}).call(this);
