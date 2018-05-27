function main(wasm) {
	wasm.exports._init(50, Math.random() * 10000, 500, 500);
	setInterval(function() {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		wasm.exports._step_circles();
	}, 50);
//unsigned nc, unsigned seed, float world_x, float world_y
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

/* Javascript:
var ctx = canvas.getContext('2d');
var wasmModule = new WebAssembly.Module(wasmCode);
var wasmInstance = new WebAssembly.Instance(wasmModule, {
	env: {
		jsDrawCircle: function(x, y, radius) {
			ctx.beginPath();
			ctx.arc(x, y, radius, 0, 2 * Math.PI, false);
			ctx.stroke();
		},
		jsDrawLine: function(x1, y1, x2, y2) {
			ctx.beginPath();
			ctx.moveTo(x1, y1);
			ctx.lineTo(x2, y2);
			ctx.stroke();
		},
		sinf: Math.sin,
		cosf: Math.cos,
		asinf: Math.asin,
		fabsf: Math.abs,
		sqrtf: Math.sqrt,
		log_num: log,
	},
});
ctx.clearRect(0, 0, canvas.width, canvas.height);
wasmInstance.exports.init(600, Math.random() * 65000, 1170, 1170);
log("begin looping");
setInterval(function() {
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	wasmInstance.exports.step_circles();
}, 50);
*/

