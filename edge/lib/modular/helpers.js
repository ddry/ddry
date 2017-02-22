// Generated by CoffeeScript 1.12.3
(function() {
  'use strict';
  module.exports = {
    filterHash: function(hash, keys) {
      var filtered, hashKey, hashKeys, i, len;
      if (!keys.length) {
        return hash;
      }
      hashKeys = Object.keys(hash);
      filtered = {};
      for (i = 0, len = hashKeys.length; i < len; i++) {
        hashKey = hashKeys[i];
        if ((hash[hashKey] != null) && this.match(hashKey, keys)) {
          filtered[hashKey] = hash[hashKey];
        }
      }
      return filtered;
    },
    getFilteredList: function(filesHash, params) {
      var list, that;
      list = Object.keys(filesHash);
      if (!(params && typeof params === 'object')) {
        return list;
      }
      if (params.only == null) {
        params.only = [];
      }
      list = Object.keys(this.filterHash(filesHash, params.only));
      if (!Array.isArray(params.except)) {
        return list;
      }
      that = this;
      return list.filter(function(name) {
        return !that.match(name, params.except);
      });
    },
    match: function(hashKey, keys) {
      var i, len, node, xPath;
      if (keys.indexOf(hashKey) !== -1) {
        return true;
      }
      hashKey = hashKey.split('.');
      if (hashKey.length === 1) {
        return false;
      }
      xPath = [];
      for (i = 0, len = hashKey.length; i < len; i++) {
        node = hashKey[i];
        xPath.push(node);
        if (keys.indexOf(xPath.join('.')) !== -1) {
          return true;
        }
      }
      return false;
    },
    parseSharedSpecs: function(filesHash, params) {
      var i, j, len, len1, module, moduleName, moduleNames, modulePath, ref, sharedSpecFolder, sharingModules, specPaths;
      moduleNames = Object.keys(filesHash);
      specPaths = {};
      for (i = 0, len = moduleNames.length; i < len; i++) {
        moduleName = moduleNames[i];
        modulePath = moduleName.split('.').join('/');
        specPaths[moduleName] = params.spec + "/" + modulePath;
      }
      if (!(params.shareSpecs && typeof params.shareSpecs === 'object')) {
        return specPaths;
      }
      ref = params.shareSpecs;
      for (sharedSpecFolder in ref) {
        sharingModules = ref[sharedSpecFolder];
        for (j = 0, len1 = sharingModules.length; j < len1; j++) {
          module = sharingModules[j];
          if (typeof specPaths[module] === 'string') {
            specPaths[module] = params.spec + "/" + sharedSpecFolder;
          }
        }
      }
      return specPaths;
    }
  };

}).call(this);
