expect = require('chai').expect

describe 'WebRTC interopability', ->
  beforeEach ->
    @webRTCInterop = require('../webrtc-interop')

  describe 'w3c standard names are present', ->
    afterEach ->
      delete global.RTCPeerConnection
      delete global.RTCSessionDescription
      delete global.RTCIceCandidate

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

  describe 'w3c standard names are not present', ->
    describe 'chrome names are present', ->
      it 'sets chrome peer connection object to w3c name', ->
        global.webkitRTCPeerConnection = webkitRtcPeerConnection = new Object

        @webRTCInterop.infectGlobal()

        expect(RTCPeerConnection).to.eq webkitRtcPeerConnection
