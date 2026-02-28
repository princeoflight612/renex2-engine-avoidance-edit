#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set the music used for the avoidance
musicID="ddpboss"; //Music used, set your music here

//Uncomment the following code if the music is loaded externally.
//In this example, the file would be named "Music\Avoidance.ogg"
//musicID = scrLoadMusic("Avoidance");


//Set the BPM of the song. Use Audacity or similar to detect it.
BPM = 220
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set the attack timings

BEAT_TIME=50/(BPM/60); //BEAT_TIME = time between beats in frames. Calculated from the BPM

//Add attacks using avoidance_add_attack. "END" should always be last
numTimings=0;

attackNames=ds_list_create();
attackTimings=ds_list_create();
avoidance_add_attack("ATTACK1",0);
avoidance_add_attack("ATTACK2",200);
avoidance_add_attack("ATTACK3",400);

avoidance_add_attack("END",2000);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Set the debug keys

numDebugKeys=0;
debugKeys=ds_list_create();
debugKeyTimings=ds_list_create();
debugKeyStartX=ds_list_create();
debugKeyStartY=ds_list_create();


//Add debug keys here using avoidance_add_debug_key
avoidance_add_debug_key(ord("1"),500);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Set up the internal variables and start the avoidance

sound_play_music(musicID,false);

attack=0;


t=0;
t_music=0;
finish=false;
RealStep=0;


startTiming=0;
endTiming = ds_list_find_value(attackTimings,numTimings-1);
//endTiming=attackTimings[|numTimings-1];//floor(audio_sound_length(musicID)*50);


if(instance_number(object_index)>1) {
    instance_destroy();
    exit;
}

//Reset infjump, nodeath and player gravity to avoid replay/restart bugs
highlight=-1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Set up end room and boss item


autoWarp=true;

roomTo=rmClear; //set the room to go to at the end of the avoidance. Disabled if autoWarp is set to false;
bossItem=-1; //set the boss item to award the player. Default is -1 => do not award any boss item
secretItem=-1; //set the secret item to award the player. Default is -1 => do not award any secret item
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Call the cleanup event
event_user(0);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Increment timer, sync to music
if(!instance_exists(objAvoidanceMarker)){
     instance_destroy();
     exit;
}
t+=1;
t_music=t;
//Anti-desync taken from Shift Engine.

if(t > 0){
    var music_t;music_t= sound_get_pos(global.music_instance)*sound_get_length(global.music_instance)*50;
    if(abs(t_music - music_t) > 5){
        sound_set_pos(global.music_instance,t_music/sound_get_length(global.music_instance)/50);
    }
}
if(attack<numTimings-1){
    if(t>ds_list_find_value(attackTimings,attack+1)){
        attack+=1;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Debug timeline and keys


///TODO change the cursor sprite to an indicator on the debug bar when hovering above it
///TODO implement snapping to the start of the nearest attack which would set the timer to attackTiming-1
if(!global.release_mode){
    if(keyboard_check_pressed(ord("T"))) global.displayDebugTimeline = !global.displayDebugTimeline; //Toggle the debug timeline via the T key


    if(keyboard_check_pressed(vk_space)){ //Set a debug snap on SPACE
        global.debugSnaps[global.numDebugSnaps]=t;
        global.numDebugSnaps+=1;
        show_debug_message(string(t));
    }
    if(point_in_rectangle(mouse_x,mouse_y,32,0,room_width-32,64)&&mouse_check_button_pressed(mb_left)){ //Navigate the timeline by clicking on it
        var trackPos;trackPos=lerp(startTiming,endTiming,(mouse_x-32)/(room_width-64))
        avoidance_jump_to_timing(trackPos);
    }

    //Jump to a debug snap by clicking on it
    var spacing;spacing = 32;
    for(i=0;i<global.numDebugSnaps;i+=1){
        var snapX;snapX=room_width-64;
        var snapY;snapY=64+spacing*(i+1)
        if(point_in_rectangle(mouse_x,mouse_y,snapX,snapY,snapX+64,snapY+spacing)){
            highlight=i;
            if(mouse_check_button_pressed(mb_left)){
                var trackPos;trackPos = global.debugSnaps[i];
                avoidance_jump_to_timing(trackPos);
            }
        }
    }
    //User made debug keys
    for(i=0;i<numDebugKeys;i+=1){
        if(keyboard_check_pressed(ds_list_find_value(debugKeys,i))){
            var trackPos;trackPos = ds_list_find_value(debugKeyTimings,i);
            avoidance_jump_to_timing(trackPos);
            with(player){
                if(ds_list_find_value(other.debugKeyStartX,i)!=-1) x = ds_list_find_value(other.debugKeyStartX,i);
                if(ds_list_find_value(other.debugKeyStartY,i)!=-1) x = ds_list_find_value(other.debugKeyStartY,i);
            }
        }
    }

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Attacks
var ct;ct=t-ds_list_find_value(attackTimings,attack);
var gt;gt=t;
var BT;BT=BEAT_TIME;

if(!instance_exists(Player)) exit;

switch(ds_list_find_value(attackNames,attack)){ //Main attack loop
    case "ATTACK1":
    {
        if(ct==1)
        {
            shader_push(shEasyShaderExample(),0.01);
        }
        break;
    }
    case "ATTACK2":
    {
        break;
    }
    case "ATTACK3":
    {
        break;
    }
    case "END":
    {
        if(ct==1){

            if(bossItem!=-1) global.bossItem[bossItem]=1;
            if(secretItem!=-1) global.secretItem[secretItem]=1;
            if(autoWarp){
                with(Player) instance_destroy();
                room_goto(roomTo);
            }
        }
        break;
    }
    default:
    {
        show_debug_message("WARNING: Attack "+ds_list_find_value(attackNames,attack)+" is empty!");
        break;
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Anti-desync - set RealStep according to music time


RealStep += room_speed * delta_time / 1000000;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Clean up


ds_list_destroy(attackNames);
ds_list_destroy(attackTimings);
ds_list_destroy(debugKeys);
ds_list_destroy(debugKeyTimings);
ds_list_destroy(debugKeyStartX);
ds_list_destroy(debugKeyStartY);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///draw nothing
#define Trigger_Draw GUI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Debug timeline


///TODO implement a transparent hovering cursor
if(!global.release_mode&&global.displayDebugTimeline){
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle_color(32,32,room_width-32,48,c_black,c_black,c_black,c_black,0);
    var barPosition;barPosition=lerp(32,room_width-32,(t-startTiming)/(endTiming-startTiming));
    draw_rectangle_color(barPosition-0.5,32+8-16,barPosition+0.5,32+8+16,c_white,c_white,c_white,c_white,0);
    for(i=0;i<numTimings;i+=1){ //Display attack timings
        var markPosition;markPosition=lerp(32,room_width-32,(ds_list_find_value(attackTimings,i)-startTiming)/(endTiming-startTiming));

        draw_set_alpha(0.7);
        draw_rectangle_color(markPosition-1.0,32+8-16,markPosition+1.0,32+8+16,c_white,c_white,c_white,c_white,0);
        draw_set_alpha(1);
    }
    draw_set_font(fntFileSmall);
    draw_set_color(c_white);
    draw_set_align(-1,-1);
    draw_text(room_width-64,64,t);
    var spacing;spacing=32;
    for(i=0;i<global.numDebugSnaps;i+=1){
        if(highlight==i) draw_set_color(c_yellow);
        draw_text(room_width-64,64+spacing*(i+1),global.debugSnaps[i]);
        draw_set_color(c_white);
        var markPosition;markPosition=lerp(32,room_width-32,(global.debugSnaps[i]-startTiming)/(endTiming-startTiming));
        draw_set_alpha(0.7);
        draw_rectangle_color(markPosition-0.8,32+8-12,markPosition+0.8,32+8+12,c_white,c_white,c_white,c_white,0);
        draw_set_alpha(1);
    }
    highlight=-1;
}
