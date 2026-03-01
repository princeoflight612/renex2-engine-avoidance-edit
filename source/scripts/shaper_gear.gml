///shaper_gear(theta,n)

///Shaper scripts return a pair of values corresponding to the polar position of a point on a parametric curve
///theta goes from 0 to 1
var theta; theta = argument0;
var n; n = argument1;

var R; R = 0.5+0.5*(((n*theta) mod 1)>0.5);
var THETA; THETA = 360*theta;



///Pack the values into an array and return them
RETURN[0]=R;
RETURN[1]=THETA;
