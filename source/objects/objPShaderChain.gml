#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
surf1=surface_create(800,608);
surf2=surface_create(800,608);


t=0;

numShaders=2;

chain[0] = instance_create(0,0,objPShaderChainElement);
chain[1] = instance_create(0,0,objPShaderChainElement);
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Clean up
if(surface_exists(surf1)) surface_free(surf1);
if(surface_exists(surf2)) surface_free(surf2);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t+=1;
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Call the destroy event to clean up
instance_destroy();
#define Other_19
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///do not fire this with the rest of draw gui events, instead always run it before
surface_reset();

var i;

for(i =0;i<numShaders;i+=1){
    if(!instance_exists(chain[i])) exit;

    var currSurf; currSurf =surf1;
    var targetSurf; targetSurf =surf2;

    if(i mod 2==0){
        currSurf=surf2;
        targetSurf=surf1;
    }
    if(!surface_exists(surf1)){
        surf1=surface_create(800,608);
    }
    if(!surface_exists(surf2)){
        surf2=surface_create(800,608);
    }

    if(i==0) surface_copy(currSurf,0,0,application_surface);

    surface_set_target(targetSurf);
    draw_clear_alpha(c_black,0);

    //var shaderTimerHandle; shaderTimerHandle =shader_get_uniform(chain[i].shader,"time");
    //var shaderIntensityHandle; shaderIntensityHandle =shader_get_uniform(chain[i].shader,"intensity");
    shader_pixel_set(chain[i].shader);

    shader_pixel_uniform_f("_time",t/50);
    shader_pixel_uniform_f("_intensity",chain[i].intensity);



    //shader_set_uniform_f(shaderTimerHandle,t/50);
    //shader_set_uniform_f(shaderIntensityHandle,chain[i].intensity);

    draw_surface(currSurf,0,0);

    shader_reset();
    draw_set_blend_mode(bm_add);
    draw_set_color(c_black);
    draw_rectangle(0,0,800,608,0);
    draw_set_color(c_white);
    draw_set_blend_mode(bm_normal);


    surface_reset_target();
    //if(i==numShaders-1) draw_surface(targetSurf,0,0);
    if(i==numShaders-1) surface_copy(application_surface,0,0,targetSurf);
}

application_surface=surface_set("application_surface",global.APPwidth,global.APPheight)
