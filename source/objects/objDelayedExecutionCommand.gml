#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
delay-=1;

if(delay<=0){
    event_user(0); //execute the given script
    instance_destroy();
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch(numargs){
    case 0:
        script_execute(scr);
        break;
    case 1:
        script_execute(scr,args[2]);
        break;
    case 2:
        script_execute(scr,args[2],args[3]);
        break;
    case 3:
        script_execute(scr,args[2],args[3],args[4]);
        break;
    case 4:
        script_execute(scr,args[2],args[3],args[4],args[5]);
        break;
    case 5:
        script_execute(scr,args[2],args[3],args[4],args[5],args[6]);
        break;
}
