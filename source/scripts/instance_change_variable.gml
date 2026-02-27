/// instance_change_variable( targetId, varName, targetX, duration, [easingFunc] = tween_linear )
/**
    * Change the variable given by the string varName to targetX over time.
    * New instance commands override existing ones.
    * @param {instanceID} targetId - The instance to change a variable of.
    * @param {string} varName - A string containing the name of the variable to change.
    * @param {float} targetX - The final value of the manipulated variable.
    * @param {integer} duration - The duration of the change, in frames.
    * @param {easingFuncID} [easingFunc] - The easing function to use. The default is tween_sine_inout.
    *
*/
var targetId;targetId = argument[0];
var varName;varName = argument[1];
var targetX;targetX = argument[2];
var duration;duration = argument[3];

var easingFunc;easingFunc = tween_linear;
if( argument_count > 4 ) {
    easingFunc = argument[4];
}

with( targetId ) {
    var command;command = instance_create( x, y, objChangeVariableCommand );
    command.TargetId = id;
    command.varName=varName;
    command.StartVar=variable_instance_get(id,varName);
    command.DeltaX = targetX - command.StartVar;
    command.Step = 0;
    command.Duration = max( duration, 1 );
    command.Smoother = easingFunc;
    self.Internal_ChangeVariableCommand = command;
}
