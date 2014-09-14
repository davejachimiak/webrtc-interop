# WebRTC Interop

This infects the global namespace with w3c object names for
WebRTC objects if they do not yet exist. If Chrome or Firefox
names are present, it sets those on the w3c object names.

## Usage

### Node

With npm:

```sh
$ npm install webrtc-interop
```

or in your dependencies hash in package.json:

```json
{
  "webrtc-interop":"~0.1"
}
```

Require and call `.infect` on it:

```js
require('webrtc-interop').infect()
```

### Browser

Add the browserified version to where your javascripts are stored:

```sh
$ wget -O ./path/to/javascripts/webrtc-interop.bundle.js https://raw.githubusercontent.com/davejachimiak/webrtc-interop/master/webrtc-interop.bundle.js
```

A production version is also available via `webrtc-interop.bundle.min.js`.

Then add it to the source of a script tag in your html:

```html
<head>
  <script src="path/to/javascripts/webrtc-interop.bundle.js" type="text/javascript">
</head>
```

An object called `WebRTCInterop` will be injected into the global namespace. Call `.infect` on it.

```js
WebRTCInterop.infect()
```
