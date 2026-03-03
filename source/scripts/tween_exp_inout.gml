/// tween_exp_inout( begin, totalDelta, step, duration );
var beginValue;beginValue= argument0;
var totalDelta;totalDelta= argument1;
var step;step= argument2;
var duration;duration= argument3;

step /= duration / 2;
if( step < 1 ) {
    return beginValue + totalDelta / 2 * power( 2, 10 * ( step - 1 ) );  
} else {
    return beginValue + totalDelta  / 2 * ( 2 - power( 2, -10 * ( step - 1 ) ) );
}
