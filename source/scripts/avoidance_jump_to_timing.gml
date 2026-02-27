/// avoidance_jump_to_timing(timing,opt_cleanup);
/*
    * Sets the avoidance timer to a value specified by **timing**.
    * If **opt_cleanup** is set to true, also cleans up all of the avoidance entities such as bullets.
    *
    * @param {int} timing - The timing to jump to.
    * @param {boolean} opt_cleanup - Whether to clean up the avoidance entities.
    *
*/
var timing;timing=argument[0];
var opt_cleanup;opt_cleanup=1;
if(argument_count>1) opt_cleanup = argument[1];
sound_set_pos(global.music_instance,timing/sound_get_length(global.music_instance)/50);

t=floor(timing);
for(i=0;i<ds_list_size(attackTimings)-1;i+=1){
    if(timing*50>ds_list_find_value(attackTimings,i)){
        attack=i;
        break;
    }
}
if(opt_cleanup){
    with(objAvoidanceEntity) {
        if(!child)
        instance_destroy();
    }
}
