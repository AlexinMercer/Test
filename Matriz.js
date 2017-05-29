var n = 20;
var rotaciones = [1,-1,-1,1,1,1,1,-1];
var coordenada = {
	x: 4,
	y: 6
};

var m = [];
var c = 1;
for (var y = 0; y < n; y++) {
	var col = [];
	for (var x = 0; x < n; x++) {
		col.push(c);
		c++;
	};
	m.push(col);
};

var result = m[coordenada.y][coordenada.x];
console.log(result);