/// tween_exp_in( begin, totalDelta, step, duration );
var beginValue;beginValue= argument0;
var totalDelta;totalDelta= argument1;
var step;step= argument2;
var duration;duration= argument3;

return beginValue + totalDelta * power( 2, 10 * ( step / duration - 1 ) );
