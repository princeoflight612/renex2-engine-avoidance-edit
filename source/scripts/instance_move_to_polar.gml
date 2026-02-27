///instance_move_to_polar( targetId, pivotX, pivotY, targetRadius, targetAngle, duration, easingFunc = tween_sine_inout )
/**
    * Move an instance or all instances of an object to a given position, in polar coordinates around a specified point.
    *
    * New instance commands override existing ones.
    * @param {instanceID} targetId - The instance to move.
    * @param {float} pivotX - The X coordinate of the point to move the instance around.
    * @param {float} pivotY - The Y coordinate of the point to move the instance around.
    * @param {float} targetRadius - The distance from the pivot point to move the instance to.
    * @param {float} targetAngle - The angle to move the instance to, with 0 being the positive horizontal axis (the 3 o'clock position)
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} [easingFunc] - The easing function to use. The default is tween_linear.
    * 
*/
var targetId;targetId = argument[0];
var targetX;targetX = argument[1];
var targetY;targetY = argument[2];
var targetRadius;targetRadius = argument[3];
var targetAngle;targetAngle = argument[4];
var duration;duration = argument[5];

var easingFunc;easingFunc = tween_sine_inout;
if( argument_count > 6 ) {
    easingFunc = argument[6];
}

with( targetId ) {
    var command;command = instance_create( x, y, objMoveToPolarCommand );
    command.TargetId = id;
    command.PointX = targetX
    command.PointY = targetY
    command.StartDist = point_distance(x,y,targetX,targetY);
    command.StartAngle = point_direction(x,y,targetX,targetY)+180;
    command.AngleDelta = targetAngle;
    command.RadiusDelta = targetRadius - command.StartDist;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_MoveToPolarCommand = command;
}
