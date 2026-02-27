/// tween_sine_in( beginValue, totalDelta, step, duration );
//var beginValue = argument0;
//var totalDelta = argument1;
//var step = argument2;
//var duration = argument3;

return argument0 + argument1 * (1-cos( ( pi / 2 ) * argument2 / argument3 ));
