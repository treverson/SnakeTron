require.config
	paths:
		'underscore': 'libs/underscore'
		'socketio': '/socket.io/socket.io.js'
	shim:
		'underscore':
			exports: '_'
		'socketio':
			exports: 'io'


define [
	'underscore',
	'socketio'
], (_, io) ->
	l = window.location
	socket = io.connect l.protocol+l.host

	socket.emit 'hartbeet'
	setInterval socket.emit.bind(this, 'hartbeet'), 1000
