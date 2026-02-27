///scrPostProcessing()

//fire all of the "draw gui" events here



var i;
var n;n=ds_list_size(global.gui_registry);
for(i=0;i<n;i+=1)
{
    with(ds_list_find_value(global.gui_registry,i))
    {
        event_user(1);
    }
}



///Shaders

if(instance_exists(objPShaderEffect)){

    with(objPShaderEffect){
        if(!surface_exists(surf)){
            surf=surface_create(800,608);
        }
        surface_copy(surf,0,0,application_surface);
        shader_pixel_set(shader);
        shader_pixel_uniform_f("_intensity",intensity);
        shader_pixel_uniform_f("_time",t/50);
        draw_surface(surf,0,0);
        shader_reset();

    }
}else{
    draw_surface(application_surface,0,0);
}

///Ance Score system controller draw - TODO move to controller object
if(global.scoreVisible){
    draw_set_font(fntFileSmall);
    draw_set_align(1,1);
    draw_set_color(c_white);
    draw_text(room_width-32-6,64+6,string(floor(global.hitScore)));
    draw_text(room_width-32-6,96+6,"x"+string(global.comboMultiplier));

    draw_set_align(-1,-1)
    //draw_text(32+6,32+6,"FC: "+string(global.fullCombo));
    //draw_text(32+6,64+6,"RANK: "+rankText[global.currentRank]);

    draw_set_font(font12);
    draw_set_align(1,1);
}
draw_set_alpha(1);
