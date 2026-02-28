///shaper_star(theta,n)

///Shaper scripts return a pair of values corresponding to the X and Y position of a point on a parametric curve
///theta goes from 0 to 1
var theta; theta = argument0;
var n; n = argument1;
var X,Y;X=0;Y=0;


var i;for(i=0;i<n;i+=1){
    if(theta>=i/n&&theta<(i+1)/n){
        var X1; X1 = dcos(360*i/n);
        var Y1; Y1 = -dsin(360*i/n);
        
        var X2; X2 = dcos(360*(i+2)/n);
        var Y2; Y2 = -dsin(360*(i+2)/n);
        X = lerp(X1,X2,n*(theta-i/n));
        Y = lerp(Y1,Y2,n*(theta-i/n));
        break;
    }
}

var R; R = point_distance(0,0,X,Y);
var THETA; THETA = point_direction(0,0,X,Y);

///Pack the values into an array and return them
var a;
RETURN[0]=0;
RETURN[1]=0;

RETURN[0]=R;
RETURN[1]=THETA;



