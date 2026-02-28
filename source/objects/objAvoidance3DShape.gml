#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
numBullets = 1 //Number of bullets in the circle
dAngle = 1 //Time increment, where 1t = 1 cycle. In the default case, one cycle is 200 frames. (4 seconds)

motion = 1 //Motion setting: 1 = normal circle, 2 = loop back to center, 3 = complex circle, 4 = swaying circle
radius = 0; //Maximum distance of the bullets from the center

angle = 0

init=false;
circleID=0;
lineBullets=0;
initBulletAngle=-90;
bulletID=objAvoidance3DBullet;

phi=180//random(360);
dPhi=0;
theta=0;
dTheta=0;

frozen=false;
slowdown=false;

killer=true;
image_alpha=1.0;

baseScale=1.0;

z=0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Shaper script
shaper = shaper_circle;
n=6;



phase=0;
dPhase=0;


///Morphing
newShaper = shaper;
newN = n;
morph = false;
morphInst = noone;
morphT = 0; //normalized T from 0 to 1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;
// Calculate radius and angle based on timer and radius
// Then move each cherry to that location
// Code ported from Collect the Pixels
if(frozen) exit;
theta+=dTheta;
phi+=dPhi;
if(!init){
    init=true;
    for (i=0; i<numBullets; i+=1) {
        bullets[i] = instance_create(x, y, bulletID)
        bullets[i].image_alpha=0;
        bullets[i].image_speed=0;
    }
}

radius=image_xscale;
for (i=0; i<numBullets; i+=1) {
    if(instance_exists(bullets[i])){
        var ct;ct= phase/360+i/numBullets; // individual cherry's time
        var r;r=radius;
        var a;a=ct;
        
       
        script_execute(shaper,ct,n);
        var r_old;r_old=RETURN[0];
        var theta_old;theta_old=RETURN[1];
        r = radius*r_old;
        a = theta_old+angle;
        
        if(morph){
            
            script_execute(newShaper,ct ,newN);
            r=radius*lerp(r_old,RETURN[0],morphT);
            a=angle+theta_old+morphT*angle_difference(RETURN[1],theta_old);
            show_debug_message(morphT);
        }
        // Move bullets
        var baseX;baseX=lengthdir_x(r, a);
        var baseY;baseY=lengthdir_y(r*dcos(theta), a);
        
        bullets[i].x = x+baseX*dcos(phi)+baseY*dsin(phi); // apply rotation
        bullets[i].y = y+baseX*dsin(phi)-baseY*dcos(phi);
        
        
        bullets[i].z = z+r*dcos(a-90)*dsin(theta)
        bullets[i].baseAlpha=image_alpha;
        bullets[i].killer=killer;
        bullets[i].r = radius;
        bullets[i].baseScale=baseScale;
        
    } 
}
angle += dAngle;
phase += dPhase;
