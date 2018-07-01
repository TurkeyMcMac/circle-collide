const INITIAL_POPULATION = 25;
const KEYCODE_ENTER = 13;
const SECONDS_PER_GENERATION = 60;
const SENSOR_BLUE = "#9999ff";
const CIRCLE_BLUE = "#00003f";

var wasm;

var worldWidth = 40;
var worldHeight = 20;
var tileSize;

// Elements touched by JavaSript
var canvas = document.getElementById('circle-canvas'), ctx;
var generationNum = document.getElementById('generation-num');
var genomeLoader = document.getElementById('load-genome');
var populationBox = document.getElementById("circle-population");
var restartButton = document.getElementById('restart-button');
var saveData = document.getElementById('save-data');
var scoreList = document.getElementById('score-list');
var timerMinDisplay = document.getElementById("timer-min");
var timerSecDisplay = document.getElementById("timer-sec");
populationBox.value = INITIAL_POPULATION;

function nextGeneration() {
	scoreList.innerHTML = null;
	wasm._next_generation();
	++generationNum.innerHTML;
	resetTimer(nextGeneration);
}

function initializeWorld(population) {
	resetTimer(nextGeneration);
	displayTimer();
	wasm._seed_random(Math.random() * 10000);
	wasm._init_world(worldWidth, worldHeight, tileSize);
	wasm._populate_world(population);
	generationNum.innerHTML = 0;
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

function displayTimer() {
	timerMinDisplay.innerHTML = timerMin;
	timerSecDisplay.innerHTML = (timerSec < 10 ? "0" : "") + timerSec;
}

tileSize = Math.min(canvas.width / worldWidth, canvas.height / worldHeight);
ctx = canvas.getContext('2d');
ctx.strokeStyle = SENSOR_BLUE;

var memory =  new WebAssembly.Memory({initial: 256});
var imports = {
	'env': {
		'memoryBase': 0,
		'tableBase': 0,
		'memory': memory,
		'table': new WebAssembly.Table({
			initial: 128,
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
		'_jsAppendScore': function(score) {
			var tr = document.createElement('tr');
			var td = document.createElement('td');
			td.innerHTML = score;
			tr.appendChild(td);
			scoreList.appendChild(tr);
		},
		'_jsDrawCircle': function(x, y, radius) {
			ctx.strokeStyle = CIRCLE_BLUE;
			ctx.beginPath();
			ctx.ellipse(x, y, radius, radius, 0, 0, 2 * Math.PI,
				false);
			ctx.stroke();
			ctx.strokeStyle = SENSOR_BLUE;
		},
		'_jsDrawLine': function(x1, y1, x2, y2) {
			ctx.beginPath();
			ctx.moveTo(x1, y1);
			ctx.lineTo(x2, y2);
			ctx.stroke();
		},
		'_jsLogNum': console.log,
		'_jsSetSave': function(addr, len) {
			var string = '';
			var slice = new Uint8Array(memory.buffer.slice(addr, addr + len));
			for (i in slice) {
				var n = slice[i];
				if (n < 16)
					string += '0';
				string += n.toString(16);
			}
			saveData.innerHTML = string;
		},
	},
};
WebAssembly.instantiateStreaming(fetch("main.wasm"), imports)
	.then(wa => wasm = wa.instance.exports)
	.then(_ => setInterval(function() {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		wasm._step_circles();
	}, 50));

function initializeWorldWithGenome(genome, population) {
	for (var i = 0, gene = genome.slice(0, 2);
	     gene.length === 2 && wasm._write_gene(parseInt(gene, 16));
	     i += 2, gene = genome.slice(i, i + 2))
		;
	resetTimer(nextGeneration);
	displayTimer();
	wasm._seed_random(Math.random() * 10000);
	wasm._init_world(worldWidth, worldHeight, tileSize);
	wasm._populate_world_with_genome(population);
	generationNum.innerHTML = 0;
}


restartButton.addEventListener("click", function(_) {
	var genome = genomeLoader.value;
	var population = populationBox.valueAsNumber;
	if (genome.length > 0)
		initializeWorldWithGenome(genome, population);
	else
		initializeWorld(population);
});
