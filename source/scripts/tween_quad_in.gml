/// tween_quad_in( begin, totalDelta, step, duration );
var beginValue;beginValue= argument0;
var totalDelta;totalDelta= argument1;
var step;step= argument2;
var duration;duration= argument3;

step /= duration;
return beginValue + totalDelta * step * step;
