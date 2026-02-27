/// tween_return_linear( beginValue, totalDelta, step, duration );


var hDuration;hDuration=0.5*argument3;
if( argument2 <= hDuration) {
    return tween_linear( argument0, argument1, argument2, hDuration );
} else {
    return tween_linear( argument0 + argument1, -argument1, argument2 - hDuration, hDuration );
}
