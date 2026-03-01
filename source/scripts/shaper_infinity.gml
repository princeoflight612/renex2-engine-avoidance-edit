///shaper_circle(theta,n)

///Shaper scripts return a pair of values corresponding to the polar position of a point on a parametric curve
///theta goes from 0 to 1
var theta; theta = argument0;
var n; n = argument1;

var X,Y;X=0;Y=0;
var newTheta; newTheta =360*theta;
var _sqrt2; _sqrt2 = 1.41421356237
var _denominator; _denominator = 1/(1+sqr(dsin(360*theta)));
X = _sqrt2*dcos(360*theta)*_denominator;
Y = _sqrt2*dcos(360*theta)*dsin(360*theta)*_denominator;

///Convert to polar

var R; R = point_distance(0,0,X,Y);
var THETA; THETA = point_direction(0,0,X,Y);


///Pack the values into an array and return them
RETURN[0]=R;
RETURN[1]=THETA;
