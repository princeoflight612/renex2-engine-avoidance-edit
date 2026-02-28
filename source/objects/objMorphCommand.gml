#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if( !instance_exists( TargetId )) {
    instance_destroy();
    exit;
}
Step+=1;


if( Step >= Duration ) {
    //TargetId.x = xstart + DeltaX;

    with(TargetId){
        morphT = 1.0;
        morph=false;
        shaper=newShaper;
        n=newN;
    }
    instance_destroy();
    exit;
}

var tweenPos;tweenPos = script_execute( Smoother, 0, 1, Step, Duration );
TargetId.morphT=tweenPos;
