/// tween_back_out( beginValue, totalDelta, step, duration );
var beginValue;beginValue= argument0;
var totalDelta;totalDelta= argument1;
var step;step= argument2;
var duration;duration= argument3;

var s;s= 1.70158;
var tRatio;tRatio= step / duration - 1;

return beginValue + totalDelta * ( 1 + tRatio * tRatio * ( ( s + 1 ) * tRatio + s ) );
