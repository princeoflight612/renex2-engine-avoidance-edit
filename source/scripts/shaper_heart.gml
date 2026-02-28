///shaper_heart(theta,n)

///Shaper scripts return a pair of values corresponding to the X and Y position of a point on a parametric curve
///theta goes from 0 to 1
var theta; theta = argument0;
var n; n = argument1;
var X,Y;
var tt; tt = theta*360;


X = power(dsin(tt),3);
Y = (13*dcos(tt)-5*dcos(2*tt)-2*dcos(3*tt)-dcos(4*tt))/16;


///Convert to polar

var R; R = point_distance(0,0,X,Y);
var THETA; THETA = point_direction(0,0,X,Y);


///Pack the values into an array and return them
var a;
RETURN[0]=0;
RETURN[1]=0;

RETURN[0]=R;
RETURN[1]=THETA;



