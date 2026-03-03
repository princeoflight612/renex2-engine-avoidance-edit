/// tween_back_in( beginValue, totalDelta, step, duration );
var beginValue;beginValue= argument0;
var totalDelta;totalDelta= argument1;
var step;step= argument2;
var duration;duration= argument3;

var s;s= 1.70158;
var tRatio;tRatio= step / duration;
return beginValue + totalDelta * tRatio * tRatio * ( ( s + 1 ) * tRatio - s );
