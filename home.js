const KEYCODE_ENTER = 13;

var canvas, ctx;
var wasm;
var worldWidth = 40;
var worldHeight = 20;
var tileSize;
var initialPopulation = 50;

function main(w) {
	initializeWorld(initialPopulation);
	setInterval(function() {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		wasm.exports._step_circles();
	}, 50);
}

function initializeWorld(population) {
	wasm.exports._seed_random(Math.random() * 10000);
	wasm.exports._init_world(worldWidth, worldHeight, tileSize);
	wasm.exports._populate_world(population);
}

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
	.then(function(wa) {
		wasm = wa.instance;
		main(wa.instance);
	});

var populationBox = document.getElementById("circle-population");
populationBox.value = initialPopulation;
populationBox.addEventListener("keyup", function(e) {
	if (e.keyCode === KEYCODE_ENTER) {
		initializeWorld(populationBox.valueAsNumber);
	}
});
