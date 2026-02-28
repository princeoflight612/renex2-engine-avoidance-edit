///shaper_flower(theta,n)

///Shaper scripts return a pair of values corresponding to the X and Y position of a point on a parametric curve
///theta goes from 0 to 1
var theta; theta = argument0;
var n; n = argument1;
var tt; tt =360*theta;

var amplitude; amplitude =abs(tt mod (360/n)-(360/n)/2)/(360/n);

var R; R = 0.25+0.75*amplitude;
var THETA; THETA = 360*theta;



///Pack the values into an array and return them
var a;
RETURN[0]=0;
RETURN[1]=0;

RETURN[0]=R;
RETURN[1]=THETA;

