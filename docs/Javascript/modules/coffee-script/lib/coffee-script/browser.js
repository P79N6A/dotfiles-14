// Generated by CoffeeScript 1.9.0
(function() {
  var CoffeeScript, compile, runScripts,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  CoffeeScript = require('./coffee-script');

  CoffeeScript.require = require;

  compile = CoffeeScript.compile;

  CoffeeScript["eval"] = function(code, options) {
    if (options == null) {
      options = {};
    }
    if (options.bare == null) {
      options.bare = true;
    }
    return eval(compile(code, options));
  };

  CoffeeScript.run = function(code, options) {
    if (options == null) {
      options = {};
    }
    options.bare = true;
    options.shiftLine = true;
    return Function(compile(code, options))();
  };

  if (typeof window === "undefined" || window === null) {
    return;
  }

  if ((typeof btoa !== "undefined" && btoa !== null) && (typeof JSON !== "undefined" && JSON !== null) && (typeof unescape !== "undefined" && unescape !== null) && (typeof encodeURIComponent !== "undefined" && encodeURIComponent !== null)) {
    compile = function(code, options) {
      var js, v3SourceMap, _ref;
      if (options == null) {
        options = {};
      }
      options.sourceMap = true;
      options.inline = true;
      _ref = CoffeeScript.compile(code, options), js = _ref.js, v3SourceMap = _ref.v3SourceMap;
      return js + "\n//# sourceMappingURL=data:application/json;base64," + (btoa(unescape(encodeURIComponent(v3SourceMap)))) + "\n//# sourceURL=coffeescript";
    };
  }

  CoffeeScript.load = function(url, callback, options, hold) {
    var xhr;
    if (options == null) {
      options = {};
    }
    if (hold == null) {
      hold = false;
    }
    options.sourceFiles = [url];
    xhr = window.ActiveXObject ? new window.ActiveXObject('Microsoft.XMLHTTP') : new window.XMLHttpRequest();
    xhr.open('GET', url, true);
    if ('overrideMimeType' in xhr) {
      xhr.overrideMimeType('text/plain');
    }
    xhr.onreadystatechange = function() {
      var param, _ref;
      if (xhr.readyState === 4) {
        if ((_ref = xhr.status) === 0 || _ref === 200) {
          param = [xhr.responseText, options];
          if (!hold) {
            CoffeeScript.run.apply(CoffeeScript, param);
          }
        } else {
          throw new Error("Could not load " + url);
        }
        if (callback) {
          return callback(param);
        }
      }
    };
    return xhr.send(null);
  };

  runScripts = function() {
    var coffees, coffeetypes, execute, i, index, s, script, scripts, _fn, _i, _len;
    scripts = window.document.getElementsByTagName('script');
    coffeetypes = ['text/coffeescript', 'text/literate-coffeescript'];
    coffees = (function() {
      var _i, _len, _ref, _results;
      _results = [];
      for (_i = 0, _len = scripts.length; _i < _len; _i++) {
        s = scripts[_i];
        if (_ref = s.type, __indexOf.call(coffeetypes, _ref) >= 0) {
          _results.push(s);
        }
      }
      return _results;
    })();
    index = 0;
    execute = function() {
      var param;
      param = coffees[index];
      if (param instanceof Array) {
        CoffeeScript.run.apply(CoffeeScript, param);
        index++;
        return execute();
      }
    };
    _fn = function(script, i) {
      var options;
      options = {
        literate: script.type === coffeetypes[1]
      };
      if (script.src) {
        return CoffeeScript.load(script.src, function(param) {
          coffees[i] = param;
          return execute();
        }, options, true);
      } else {
        options.sourceFiles = ['embedded'];
        return coffees[i] = [script.innerHTML, options];
      }
    };
    for (i = _i = 0, _len = coffees.length; _i < _len; i = ++_i) {
      script = coffees[i];
      _fn(script, i);
    }
    return execute();
  };

  if (window.addEventListener) {
    window.addEventListener('DOMContentLoaded', runScripts, false);
  } else {
    window.attachEvent('onload', runScripts);
  }

}).call(this);
