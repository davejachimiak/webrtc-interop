// Generated by CoffeeScript 1.7.1
(function() {
  var WebRTCInterop;

  WebRTCInterop = (function() {
    function WebRTCInterop() {}

    WebRTCInterop.infectGlobal = function() {
      var _ref, _ref1, _ref2;
      global.RTCPeerConnection = (_ref = (_ref1 = global.RTCPeerConnection) != null ? _ref1 : global.webkitRTCPeerConnection) != null ? _ref : global.mozRTCPeerConnection;
      return global.RTCSessionDescription = (_ref2 = global.RTCSessionDescription) != null ? _ref2 : global.mozRTCSessionDescription;
    };

    return WebRTCInterop;

  })();

  module.exports = WebRTCInterop;

}).call(this);
