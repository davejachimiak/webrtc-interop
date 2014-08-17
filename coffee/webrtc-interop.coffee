# based on http://www.webrtc.org/interop

class WebRTCInterop
  @infectGlobal: ->
    global.RTCPeerConnection = global.RTCPeerConnection ? global.webkitRTCPeerConnection ? global.mozRTCPeerConnection
    global.RTCSessionDescription = global.RTCSessionDescription ? global.mozRTCSessionDescription
    global.RTCIceCandidate = global.RTCIceCandidate ? global.mozRTCIceCandidate

module.exports = WebRTCInterop
