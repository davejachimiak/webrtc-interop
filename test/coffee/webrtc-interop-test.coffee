expect = require('chai').expect

describe 'WebRTC interopability', ->
  beforeEach ->
    @webRTCInterop = require('../webrtc-interop')

  describe 'w3c standard names are present', ->
    afterEach ->
      global.RTCPeerConnection = undefined
      global.RTCSessionDescription = undefined

    it 'leaves the peer connection name the same', ->
      global.RTCPeerConnection = rtcPeerConnection = new Object

      @webRTCInterop.infectGlobal()

      expect(RTCPeerConnection).to.eq rtcPeerConnection

    it 'leaves the session description name the same', ->
      global.RTCSessionDescription = rtcSessionDescription = new Object

      @webRTCInterop.infectGlobal()

      expect(RTCSessionDescription).to.eq rtcSessionDescription

    it 'leaves the session description name the same', ->
      global.RTCIceCandidate = rtcIceCandidate = new Object

      @webRTCInterop.infectGlobal()

      expect(RTCIceCandidate).to.eq rtcIceCandidate
