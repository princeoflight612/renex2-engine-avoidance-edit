/// tween_return_exp_inout( beginValue, totalDelta, step, duration );
var beginValue;beginValue= argument0;
var totalDelta;totalDelta= argument1;
var step;step= argument2;
var duration;duration= argument3;

var hDuration;hDuration= duration / 2;
if( step <= hDuration ) {
    return tween_exp_inout( beginValue, totalDelta, step, hDuration );
} else {
    return tween_exp_inout( beginValue + totalDelta, -totalDelta, step - hDuration, hDuration );
}
