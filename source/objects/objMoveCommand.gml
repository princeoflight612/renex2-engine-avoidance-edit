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
TargetId.x = StartX+tweenPos*DeltaX;
TargetId.y = StartY+tweenPos*DeltaY;


if( Step >= Duration ) {
    instance_destroy();
}
