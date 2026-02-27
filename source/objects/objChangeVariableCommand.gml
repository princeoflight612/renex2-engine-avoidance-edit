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
variable_instance_set(TargetId,varName,StartVar+tweenPos*DeltaX);


if( Step >= Duration ) {
    instance_destroy();
}
