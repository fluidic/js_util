(function (mod) {
  if (typeof exports == "object" && typeof module == "object") // CommonJS
      module.exports = mod();
  else if (typeof define == "function" && define.amd) // AMD
      return define([], mod);
  else // Plain browser env
      this.JsUtil = mod();
})(function () {
  "use strict";

  function JsUtil() {
  }

  JsUtil.newObject = function () {
    return {};
  };

  JsUtil.getValue = function (obj, prop) {
    return obj[prop];
  };

  return JsUtil;
});