/// tween_sine_in( beginValue, totalDelta, step, duration );
//var beginValue; beginValue = argument0;
//var totalDelta; totalDelta = argument1;
//var step; step = argument2;
//var duration; duration = argument3;

return argument0 + argument1 * (1-cos( ( pi / 2 ) * argument2 / argument3 ));
