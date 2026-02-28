///shaper_teardrop(theta,n)

///Shaper scripts return a pair of values corresponding to the polar position of a point on a parametric curve
///theta goes from 0 to 1
var theta; theta = argument0;
var n; n = argument1;
var X,Y;X=0;Y=0;
var newTheta; newTheta =360*theta;

Y=1.0*(1.0-dsin(newTheta))*dcos(newTheta);
X=2.2*(dsin(newTheta)-1.0);


///Convert to polar

var R; R = point_distance(0,0,X,Y);
var THETA; THETA = point_direction(0,0,X,Y);

///Pack the values into an array and return them
var a;
RETURN[0]=0;
RETURN[1]=0;

RETURN[0]=R;
RETURN[1]=THETA;



