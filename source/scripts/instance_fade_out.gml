/// instance_fade_out( targetId, fadeDuration );
/**
    * Gradually lower the alpha value of all instances with the given targetId.
    * When the alpha reaches zero, destroy them.
    * Fade duration represents the maximum possible duration for fully opaque instances.
    * If an instance is already partially transparent, it will disappear quicker.
    * @param {instanceID} targetId - the index of the object to fade out.
    * @param {int} fadeDuration - The duration of the fadeout for an object with full alpha, in frames.
*/
var targetId;targetId= argument0;
var fadeDuration;fadeDuration= max( argument1, 1 );

var newCommand;newCommand= instance_create( 0, 0, objFadeCommand );
newCommand.AlphaDelta = 1 / fadeDuration;

var fadeCount;fadeCount= 0;
with( targetId ) {
    newCommand.FadeList[fadeCount] = id;
    fadeCount+=1;
}
newCommand.FadeCount = fadeCount;
newCommand.alarm[0] = fadeDuration;
