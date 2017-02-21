// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = {
    fits: function(node, any) {
      if (any) {
        return typeof node !== 'undefined';
      }
      return typeof node === 'function';
    },
    parse: function(that, name, any) {
      var cursor, i, key, len, methodName, troddenPath, xPath;
      if (any == null) {
        any = true;
      }
      if (typeof that === 'function') {
        return that;
      }
      if (!(that && typeof that === 'object')) {
        return false;
      }
      xPath = name.split('.');
      if (xPath.length === 1) {
        return that[name];
      }
      methodName = xPath.pop();
      troddenPath = [];
      cursor = that;
      for (i = 0, len = xPath.length; i < len; i++) {
        key = xPath[i];
        if (typeof cursor[key] === 'object') {
          cursor = cursor[key];
          troddenPath.push(key);
        } else {
          return [troddenPath, key];
        }
      }
      if (this.fits(cursor[methodName], any)) {
        return cursor[methodName];
      }
      return [xPath, methodName];
    }
  };

}).call(this);
