#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;
for(i = 0; i < FadeCount; i+=1 ) {
    with( FadeList[i] ) {
        instance_destroy();
    }
}
instance_destroy();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;
for(i = 0; i < FadeCount; i+=1 ) {
    var targetId;targetId = FadeList[i];
    if( instance_exists( targetId ) ) {;
        targetId.image_xscale = StartXScale*alarm[0]/fadeDuration;
        targetId.image_yscale = StartYScale*alarm[0]/fadeDuration;

        if( targetId.image_xscale <= 0 ) {
            with( targetId ) {
                instance_destroy();
            }
        }
    }
}
