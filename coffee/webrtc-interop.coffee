# based on http://www.webrtc.org/interop

class WebRTCInterop
  @infectGlobal: ->
    global.RTCPeerConnection = global.RTCPeerConnection ? global.webkitRTCPeerConnection

module.exports = WebRTCInterop
