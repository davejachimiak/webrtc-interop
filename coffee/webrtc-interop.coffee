# based on http://www.webrtc.org/interop

class WebRTCInterop
  @infectGlobal: ->
    global.RTCPeerConnection = global.RTCPeerConnection ? global.webkitRTCPeerConnection ? global.mozRTCPeerConnection
    global.RTCSessionDescription = global.RTCSessionDescription ? global.mozRTCSessionDescription

module.exports = WebRTCInterop
