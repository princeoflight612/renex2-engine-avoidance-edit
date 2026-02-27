/// instance_scale( targetId, targetScale,  duration, [easingFunc] = tween_linear )
/**
    * Change the scale to targetScale over time
    * New instance commands override existing ones.
    * @param {instanceID} targetId - The instance to change a scale of
    * @param {float} targetScale - The final value of the instance scaling
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} [easingFunc] - The easing function to use. The default is tween_sine_inout.
    *
*/
var targetId;targetId = argument[0];
var targetScale;targetScale = argument[1];

var duration;duration = argument[2]

var easingFunc;easingFunc = tween_linear;
if( argument_count > 3 ) {
    easingFunc = argument[3];
}

with( targetId ) {
    var command;command = instance_create( x, y, objScaleCommand );
    command.TargetId = id;
    command.StartX=image_xscale;

    command.DeltaX = targetScale - command.StartX;

    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_MoveCommand = command;
}
