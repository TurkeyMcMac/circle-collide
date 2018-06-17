var canvas, ctx;

var worldWidth = 40;
var worldHeight = 20;
var tileSize;
var population = 50;

function main(wasm) {
	wasm.exports._seed_random(Math.random() * 10000);
	wasm.exports._init_world(worldWidth, worldHeight, tileSize);
	wasm.exports._populate_world(population);
	setInterval(function() {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		wasm.exports._step_circles();
	}, 50);
}

document.getElementById("circle-population").innerHTML =
	"population: " + population;
canvas = document.getElementById('circle-canvas');
tileSize = Math.min(canvas.width / worldWidth, canvas.height / worldHeight);
ctx = canvas.getContext('2d');
ctx.strokeStyle = '#00003f';

var imports = {
	'env': {
		'memoryBase': 0,
		'tableBase': 0,
		'memory': new WebAssembly.Memory({initial: 256}),
		'table': new WebAssembly.Table({
			initial: 64,
			element: 'anyfunc',
		}),
		'abort': function() {},
		'_acosf': Math.acos,
		'_asinf': Math.asin,
		'_atanf': Math.atan,
		'_cosf': Math.cos,
		'_fabsf': Math.abs,
		'_sinf': Math.sin,
		'_sqrtf': Math.sqrt,
		'_tanf': Math.tan,
		'_test_extern': function() {
			console.log("Extern function has been tested.");
		},
		'_jsDrawCircle': function(x, y, radius) {
			ctx.beginPath();
			ctx.ellipse(x, y, radius, radius, 0, 0, 2 * Math.PI,
				false);
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
WebAssembly.instantiateStreaming(fetch("main.wasm"), imports)
	.then(wa => main(wa.instance));
