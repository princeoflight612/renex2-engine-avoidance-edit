/// tween_back_inout( beginValue, totalDelta, step, duration );
var beginValue;beginValue= argument0;
var totalDelta;totalDelta= argument1;
var step;step= argument2;
var duration;duration= argument3;

var s;s= 1.70158 * 1.525;
var tRatio;tRatio= step / duration;

if( tRatio < 0.5 ) {
    return 2 * tRatio * tRatio * ( ( s + 1 ) * 2 * tRatio - s );
} else {
    tRatio -= 1;
    return 2 * tRatio * tRatio * ( ( s + 1 ) * 2 * tRatio + s + 2 );
}
