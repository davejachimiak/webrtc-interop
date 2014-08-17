expect = require('chai').expect

describe 'WebRTC interopability', ->
  beforeEach ->
    @webRTCInterop = require('../webrtc-interop')

  describe 'w3c standard names are present', ->
    it 'leaves the peer connection name the same', ->
      global.RTCPeerConnection = rtcPeerConnection = 'w3c peer connection'

      @webRTCInterop.infectGlobal()

      expect(RTCPeerConnection).to.eq rtcPeerConnection

      delete global.RTCPeerConnection

    it 'leaves the session description name the same', ->
      global.RTCSessionDescription = rtcSessionDescription = new Object

      @webRTCInterop.infectGlobal()

      expect(RTCSessionDescription).to.eq rtcSessionDescription

      delete global.RTCSessionDescription

    it 'leaves the session description name the same', ->
      global.RTCIceCandidate = rtcIceCandidate = new Object

      @webRTCInterop.infectGlobal()

      expect(RTCIceCandidate).to.eq rtcIceCandidate

      delete global.RTCIceCandidate

  describe 'w3c standard names are not present', ->
    describe 'chrome names are present', ->
      it 'sets chrome peer connection object to w3c name', ->
        global.webkitRTCPeerConnection = webkitRTCPeerConnection = 'chrome rtc peer connection'

        @webRTCInterop.infectGlobal()

        expect(RTCPeerConnection).to.eq webkitRTCPeerConnection

        delete global.webkitRTCPeerConnection
        delete global.RTCPeerConnection

    describe 'chrome names are not present', ->
      describe 'mozilla names are present', ->
        it 'sets mozilla peer connection object to the w3c name', ->
          global.mozRTCPeerConnection = mozRTCPeerConnection = 'moz rtc peer connection'

          @webRTCInterop.infectGlobal()

          expect(RTCPeerConnection).to.eq mozRTCPeerConnection

          delete global.mozRTCPeerConnection
          delete global.RTCPeerConnection

        it 'sets the mozilla session description object to the w3c name', ->
          global.mozRTCSessionDescription = mozRTCSessionDescription = 'moz rtc session description'

          @webRTCInterop.infectGlobal()

          expect(RTCSessionDescription).to.eq mozRTCSessionDescription

          delete global.mozRTCSessionDescription
          delete global.RTCSessionDescription

        it 'sets the mozilla session description object to the w3c name', ->
          global.mozRTCIceCandidate = mozRtcIceCandidate = new Object

          @webRTCInterop.infectGlobal()

          expect(RTCIceCandidate).to.eq mozRtcIceCandidate

          delete global.mozRTCIceCandidate
          delete global.RTCIceCandidate

      describe 'no names are present', ->
        beforeEach ->
          @webRTCInterop.infectGlobal()

        it 'sets nothing on the w3c peer connection name', ->
          expect(RTCPeerConnection).to.be.undefined

        it 'sets nothing on the w3c session description name', ->
          expect(RTCSessionDescription).to.be.undefined

        it 'sets nothing on the w3c ice candidate name', ->
          expect(RTCIceCandidate).to.be.undefined
