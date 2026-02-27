#define Step_0
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


var tweenPos;tweenPos = script_execute( Smoother, 0, 1, Step, Duration );
TargetId.image_xscale = StartX+tweenPos*DeltaX;
TargetId.image_yscale = TargetId.image_xscale;


if( Step >= Duration ) {
    instance_destroy();
}
