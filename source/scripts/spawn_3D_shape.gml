/// spawn_3D_shape(x,y,sprite,index,radius,angle,dAngle,numBullets,tag,shaper,N);
//TODO: add a demonstration of how the Euler angles (angle, theta, phi) work,
//either through a room or through an external image
/**
    * Creates a 3d shape.
    * @param {float} x - The X coordinate to create the shape at.
    * @param {float} y - The Y coordinate to create the shape at.
    * @param {spriteID} sprite - The sprite of the bullets in the shape.
    * @param {int} index - The image index of the bullets in the shape.
    * @param {float} radius - The radius of the shape, in pixels.
    * @param {float} angle - The angle of the shape around its rotation axis.
    * @param {float} dAngle - The increment of the angle.
    * @param {int} numBullets - the amount of bullets in the shape.
    * @param {string} - The tag to assign the shape.
    * @param {shaper} shaper  - The shaper function to use.
    * @param {int} N - the number of edges in the shape.
    *
*/


var spawnX; spawnX= argument[0];
var spawnY; spawnY= argument[1];
var spawnSprite; spawnSprite= argument[2];
var spawnIndex; spawnIndex= argument[3];
var spawnRadius; spawnRadius= argument[4];
var spawnAngle; spawnAngle= argument[5];
var spawnDAngle; spawnDAngle= argument[6];
var spawnNum; spawnNum= argument[7];
var spawnTag; spawnTag= argument[8];
var spawnShaper; spawnShaper= argument[9];
var spawnN; spawnN= argument[10];

var i;
var obj;obj=instance_create(spawnX,spawnY,objAvoidance3DShape);

obj.numBullets = spawnNum;
obj.image_xscale = spawnRadius;
obj.angle = spawnAngle;
obj.dAngle = spawnDAngle;
obj.tag = spawnTag;

obj.shaper=spawnShaper;
obj.n=spawnN;
with(obj){
    event_perform(ev_step,ev_step_normal);
    for(i=0;i<numBullets;i+=1){
        bullets[i].sprite_index = spawnSprite;
        bullets[i].image_index = spawnIndex;
    }
}
return obj;
