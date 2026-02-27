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
///General purpose bullet variables
image_speed=0;
killer=true;
trail=true;
image_index=3;
destroyOutside=false;

drawTag=false;
scaleTag=false;
exScale=image_xscale;

curveSpeed=0;
followDirection=0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Anti Avoidance variables
Score = 1;
Type = "Collect";
Combo = 1;
//Type = "Collect" - a regular bullet that disappears and adds score upon collision with the player
//Type = "Hold" - a bullet that does not disappear and adds score for each frame it collides with the player. Use this for persistent spawner-type bullets.
//Hold bullets will only add combo every 5 frames rather than every frame.

//Specifying a negative score value makes the bullet lower the player's score, as well as reset the combo.
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Curving and follow direction
direction+=curveSpeed;

if(followDirection) image_angle=direction;
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(destroyOutside&&(x>800+view_xview[0]&&hspeed>0||x<view_xview[0]&&hspeed<0||y>608+view_yview[0]&&vspeed>0||y<view_yview[0]&&vspeed<0))
    instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///draw nothing, any drawing is handled via a separate draw controller for performance
