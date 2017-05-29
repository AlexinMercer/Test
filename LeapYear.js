var isLeapYear = function(n){
    return ((n % 4 == 0) && (n % 100 != 0)) || (n % 400 == 0)
}

let year_start = 2000;
let year_stop = 2017;
var years = [];

for (var i = year_start; i <= year_stop; i++) {
	if (isLeapYear(i)){
        years.push(i);
    }
};

var result = years.join("@");
console.log(result)