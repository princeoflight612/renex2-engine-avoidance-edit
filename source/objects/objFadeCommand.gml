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
        targetId.image_alpha -= AlphaDelta;

        if( targetId.image_alpha <= 0 ) {
            with( targetId ) {
                instance_destroy();
            }
        }
    }
}
