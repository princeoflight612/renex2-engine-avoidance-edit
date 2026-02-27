#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Inherit the parent event
event_inherited();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///3D Bullet variables
killer=false;
z=0;
cameraZ=-800;
baseAlpha=1.0;
baseScale=1.0;
imageAlpha=1.0;


tag="";

xprev=x;
yprev=y
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Anti Avoidance variables
Score = 1;
Type = "Collect"
Combo = 1;
//Type = "Collect" - a regular bullet that disappears and adds score upon collision with the player
//Type = "Hold" - a bullet that does not disappear and adds score for each frame it collides with the player. Use this for persistent spawner-type bullets.
//Hold bullets will only add combo every 30 frames rather than every frame.

//Specifying a negative score value makes the bullet lower the player's score, as well as reset the combo.


active=true;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
if(z>0){
    imageAlpha=0.5;
}else{
    imageAlpha=1.0;
}
imageAlpha=lerp(0.15,1.0,clamp(rlerp(100,-100,z),0,1))

depth=floor(z);

image_xscale=baseScale*abs(cameraZ)/(z-cameraZ);
image_yscale=baseScale*abs(cameraZ)/(z-cameraZ);


image_alpha=baseAlpha*imageAlpha;

//show_debug_message(baseScale);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//do nothing
