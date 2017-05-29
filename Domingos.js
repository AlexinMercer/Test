var milliseconds_day = 86400000;
var date_start = "05-16-1996";
var date_stop = "05-16-2017";
var days_count = 0;

var md = [Number(new Date(date_start)),Number(new Date(date_stop))];

var i = md[0];
while( i <= md[1]){
	var d = new Date(i);
	if (d.getDate() == 1 && d.getDay() == 7) {
		days_count++;
	};
	i += milliseconds_day;
}

console.log(days_count);