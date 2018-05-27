function main(wasm) {
	wasm.exports._init(400, Math.random() * 10000, 500, 500);
	setInterval(function() {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		wasm.exports._step_circles();
	}, 50);
}

var canvas = document.getElementById('circle-canvas');
var ctx = canvas.getContext('2d');
var imports = {
	'env': {
		'memoryBase': 0,
		'tableBase': 0,
		'memory': new WebAssembly.Memory({initial: 256}),
		'table': new WebAssembly.Table({
			initial: 32,
			element: 'anyfunc',
		}),
		'abort': function() {},
		'_asinf': Math.asin,
		'_cosf': Math.cos,
		'_fabsf': Math.abs,
		'_sinf': Math.sin,
		'_sqrtf': Math.sqrt,
		'_fabsf': Math.abs,
		'_test_extern': function() {
			console.log("Extern function has been tested.");
		},
		'_jsDrawCircle': function(x, y, radius) {
			ctx.beginPath();
			ctx.arc(x, y, radius, 0, 2 * Math.PI, false);
			ctx.stroke();
		},
		'_jsDrawLine': function(x1, y1, x2, y2) {
			ctx.beginPath();
			ctx.moveTo(x1, y1);
			ctx.lineTo(x2, y2);
			ctx.stroke();
		},
		'_jsLogNum': console.log,
	},
};
WebAssembly.instantiateStreaming(fetch("circle-collide.wasm"), imports)
	.then(wa => main(wa.instance));
