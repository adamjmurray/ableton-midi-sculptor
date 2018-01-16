var width = 300
var height = 300

function window_width(w) {
	width = w
}
function window_height(h) {
	height = h
}

function msg_float(zoom) {
	var window = patcher.wind
	patcher.message('zoomfactor', zoom)
	var x = window.location[0]
	var y = window.location[1]
	window.location = [x, y, x + zoom * width, y + zoom * height]
	window.scrollto(0, 0)
}
