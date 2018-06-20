const KEYCODE_ENTER = 13;
const SECONDS_PER_GENERATION = 60;

var canvas, ctx;

var wasm;

var worldWidth = 40;
var worldHeight = 20;
var tileSize;
var initialPopulation = 25;

function main() {
	initializeWorld(initialPopulation);
	setInterval(function() {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		wasm.exports._step_circles();
	}, 50);
}

var lastHighScore = document.getElementById("last-high-score");
function nextGeneration() {
	lastHighScore.innerHTML = wasm.exports._next_generation();
	resetTimer(nextGeneration);
}

function initializeWorld(population) {
	resetTimer(nextGeneration);
	displayTimer();
	wasm.exports._seed_random(Math.random() * 10000);
	wasm.exports._init_world(worldWidth, worldHeight, tileSize);
	wasm.exports._populate_world(population);
}

var timerIntervalId;
var timerMin = 1;
var timerSec = 0;
function resetTimer(endTrigger) {
	if (timerIntervalId != undefined) {
		clearInterval(timerIntervalId);
	}
	timerMin = Math.floor(SECONDS_PER_GENERATION / 60);
	timerSec = SECONDS_PER_GENERATION % 60;
	timerIntervalId = setInterval(function() {
		if (--timerSec < 0) {
			if (--timerMin < 0)
				endTrigger();
			else
				timerSec += 60;
		}
		displayTimer();
	}, 1000);
}

var timerMinDisplay = document.getElementById("timer-min");
var timerSecDisplay = document.getElementById("timer-sec");
function displayTimer() {
	timerMinDisplay.innerHTML = timerMin;
	timerSecDisplay.innerHTML = (timerSec < 10 ? "0" : "") + timerSec;
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
		main();
	});

var populationBox = document.getElementById("circle-population");
populationBox.value = initialPopulation;
populationBox.addEventListener("keyup", function(e) {
	if (e.keyCode === KEYCODE_ENTER) {
		initializeWorld(populationBox.valueAsNumber);
	}
});
