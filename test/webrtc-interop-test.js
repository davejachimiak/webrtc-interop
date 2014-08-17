// Generated by CoffeeScript 1.7.1
(function() {
  var expect;

  expect = require('chai').expect;

  describe('WebRTC interopability', function() {
    beforeEach(function() {
      return this.webRTCInterop = require('../webrtc-interop');
    });
    describe('w3c standard names are present', function() {
      it('leaves the peer connection name the same', function() {
        var rtcPeerConnection;
        global.RTCPeerConnection = rtcPeerConnection = 'w3c peer connection';
        this.webRTCInterop.infectGlobal();
        expect(RTCPeerConnection).to.eq(rtcPeerConnection);
        return delete global.RTCPeerConnection;
      });
      it('leaves the session description name the same', function() {
        var rtcSessionDescription;
        global.RTCSessionDescription = rtcSessionDescription = new Object;
        this.webRTCInterop.infectGlobal();
        expect(RTCSessionDescription).to.eq(rtcSessionDescription);
        return delete global.RTCSessionDescription;
      });
      return it('leaves the session description name the same', function() {
        var rtcIceCandidate;
        global.RTCIceCandidate = rtcIceCandidate = new Object;
        this.webRTCInterop.infectGlobal();
        expect(RTCIceCandidate).to.eq(rtcIceCandidate);
        return delete global.RTCIceCandidate;
      });
    });
    return describe('w3c standard names are not present', function() {
      describe('chrome names are present', function() {
        return it('sets chrome peer connection object to w3c name', function() {
          var webkitRTCPeerConnection;
          global.webkitRTCPeerConnection = webkitRTCPeerConnection = 'chrome rtc peer connection';
          this.webRTCInterop.infectGlobal();
          expect(RTCPeerConnection).to.eq(webkitRTCPeerConnection);
          delete global.webkitRTCPeerConnection;
          return delete global.RTCPeerConnection;
        });
      });
      return describe('chrome names are not present', function() {
        describe('mozilla names are present', function() {
          it('sets mozilla peer connection object to the w3c name', function() {
            var mozRTCPeerConnection;
            global.mozRTCPeerConnection = mozRTCPeerConnection = 'moz rtc peer connection';
            this.webRTCInterop.infectGlobal();
            expect(RTCPeerConnection).to.eq(mozRTCPeerConnection);
            delete global.mozRTCPeerConnection;
            return delete global.RTCPeerConnection;
          });
          it('sets the mozilla session description object to the w3c name', function() {
            var mozRTCSessionDescription;
            global.mozRTCSessionDescription = mozRTCSessionDescription = 'moz rtc session description';
            this.webRTCInterop.infectGlobal();
            expect(RTCSessionDescription).to.eq(mozRTCSessionDescription);
            delete global.mozRTCSessionDescription;
            return delete global.RTCSessionDescription;
          });
          return it('sets the mozilla session description object to the w3c name', function() {
            var mozRtcIceCandidate;
            global.mozRTCIceCandidate = mozRtcIceCandidate = new Object;
            this.webRTCInterop.infectGlobal();
            expect(RTCIceCandidate).to.eq(mozRtcIceCandidate);
            delete global.mozRTCIceCandidate;
            return delete global.RTCIceCandidate;
          });
        });
        return describe('no names are present', function() {
          beforeEach(function() {
            return this.webRTCInterop.infectGlobal();
          });
          it('sets nothing on the w3c peer connection name', function() {
            return expect(RTCPeerConnection).to.be.undefined;
          });
          it('sets nothing on the w3c session description name', function() {
            return expect(RTCSessionDescription).to.be.undefined;
          });
          return it('sets nothing on the w3c ice candidate name', function() {
            return expect(RTCIceCandidate).to.be.undefined;
          });
        });
      });
    });
  });

}).call(this);
