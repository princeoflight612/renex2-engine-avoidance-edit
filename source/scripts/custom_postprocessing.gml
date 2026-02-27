//you can add custom post-processing effects here that modify the
//application_surface before it has any gui drawn to it.

///scrPostProcessing()
///Visual post processing code and the draw GUI events. To add a draw GUI event to the object:
///add user event 9 which contains all of the drawing code
///add the instance to the gui registry ds_list in the create event: ds_list_add(global.gui_registry,id)

///Shaders

if(instance_exists(objPShaderChain)){
    with(objPShaderChain){
        event_user(9);
    }
}else{
    draw_surface(application_surface,0,0);
}

//fire all of the "draw gui" events here
var i;
var n;n=ds_list_size(global.gui_registry);
for(i=0;i<n;i+=1)
{
    with(ds_list_find_value(global.gui_registry,i))
    {
        event_user(9);
    }
}

///Ance Score system controller draw - TODO move to controller object

/*
if(global.scoreVisible){
    draw_set_font(fntFileSmall);
    draw_set_align(1,1);
    draw_set_color(c_white);
    draw_text(room_width-32-6,64+6,string(floor(global.hitScore)));
    draw_text(room_width-32-6,96+6,"x"+string(global.comboMultiplier));

    draw_set_align(-1,-1)
    //draw_text(32+6,32+6,"FC: "+string(global.fullCombo));
    //draw_text(32+6,64+6,"RANK: "+rankText[global.currentRank]);

    draw_set_font(fntFileSmall);
    draw_set_align(1,1);
}

*/

draw_set_alpha(1);
