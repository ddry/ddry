// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  var io, object, scope;

  io = require('./io');

  scope = require('./scope');

  object = require('../common/object');

  module.exports = {
    oe: function(params) {
      var _, exceptIndex, oe, oneMode, onlyIndex;
      onlyIndex = params.indexOf('-o');
      exceptIndex = params.indexOf('-e');
      oneMode = params.slice(1);
      if (exceptIndex === -1) {
        return {
          only: oneMode
        };
      }
      if (onlyIndex === -1) {
        return {
          except: oneMode
        };
      }
      oe = onlyIndex < exceptIndex;
      return _ = {
        only: oe ? params.slice(onlyIndex + 1, exceptIndex) : params.slice(onlyIndex + 1),
        except: oe ? params.slice(exceptIndex + 1) : params.slice(exceptIndex + 1, onlyIndex)
      };
    },
    render: function(oe) {
      var cli, config, constraint, constraints, detect, i, item, items, len, methodPaths, mode, modulePaths, specPath;
      cli = io.load(true);
      modulePaths = cli.modulePaths;
      methodPaths = object.toArray(modulePaths);
      config = io.load();
      specPath = new RegExp("^" + config.spec + "/");
      constraints = {};
      for (mode in oe) {
        items = oe[mode];
        for (i = 0, len = items.length; i < len; i++) {
          item = items[i];
          detect = scope.detect(item, modulePaths, methodPaths, specPath);
          if (detect) {
            constraint = scope.key(mode, detect);
            object.insertKey(constraints, constraint.key, constraint.value);
          }
        }
      }
      return constraints;
    }
  };

}).call(this);