#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
additive=true;
t=0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t+=1;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Controls the drawing of all of the avoidance bullets and cosmetic objects.
Must exist in the room, otherwise avoidance bullets will be invisible.
*/

//field additive: true - use additive blending
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Draw all bullets with additive blending

if(additive) draw_set_blend_mode(bm_add);
var tt;tt=t;
with(objAvoidanceBullet){
    if(!scaleTag) draw_self();
    else draw_sprite_ext(sprite_index,image_index,x,y,exScale,exScale,image_angle,image_blend,image_alpha);

    if(Type=="Hold"){ //draw a semi-translucent triangle to indicate hold bullets
        draw_set_alpha(0.5);
        draw_set_color(c_white);
        var r;r=sprite_width;
        draw_triangle(x+r*dcos(3*tt),y-r*dsin(3*tt),x+r*dcos(3*tt+120),y-r*dsin(3*tt+120),x+r*dcos(3*tt+240),y-r*dsin(3*tt+240),true);
        draw_set_alpha(1);
    }
}
with(objAvoidance3DBullet){
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha*(0.5+0.5*active));
}
with(objAvoidanceCosmetic) draw_self();

draw_set_blend_mode(bm_normal);
