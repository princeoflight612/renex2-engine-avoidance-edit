//you can add custom post-processing effects here that modify the
//application_surface before it has any gui drawn to it.


///Shaders

if(instance_exists(objPShaderChain)){
    with(objPShaderChain){
        event_user(9);
    }
}

draw_set_alpha(1);
