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

TargetId.x = PointX+(StartDist+tweenPos*RadiusDelta)*dcos(StartAngle+tweenPos*AngleDelta);
TargetId.y = PointY-(StartDist+tweenPos*RadiusDelta)*dsin(StartAngle+tweenPos*AngleDelta);


if( Step >= Duration ) {
    instance_destroy();
    exit;
}
