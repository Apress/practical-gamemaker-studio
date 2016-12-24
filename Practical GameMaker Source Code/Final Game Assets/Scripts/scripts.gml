#define scr_angle_rotate
//find rotation angle
return argument0 + max(min(scr_cycle(argument1 - argument0, -180, 180), argument2), -argument2);

#define scr_bullet_hit
//do if hit by bullet
my_health-=other.strength;
global.hits+=1;
with (other) instance_destroy();

#define scr_buy
//check if player can buy
if  position_meeting(mouse_x, mouse_y, id) && mouse_check_button_released(mb_left)
{
    if global.cash>=global.weapon_info[2,button_id] //check if enough cash
    {  
        global.cash-=global.weapon_info[2,button_id]; //take cash away
        global.weapon_info[3,button_id]+=1; //add ammo
        scr_voice(snd_voice_purchase_complete);
    }
    else  scr_voice(snd_voice_not_enough_cash);
}


#define scr_cycle
// cycle - works with scr_angle_rotate
argument0 = (argument0 - argument1) mod (argument2 - argument1)
if (argument0 < 0) return argument0 + argument2
return argument0 + argument1;

#define scr_draw_shop
//draw button and text
draw_self();
scr_shop_set_text();
draw_text(50,y, global.weapon_info[0,button_id]);//draw name
draw_text(250,y, global.weapon_info[1,button_id]);//strength
draw_text(350,y, global.weapon_info[2,button_id]);//cost
draw_text(450,y, global.weapon_info[3,button_id]);//current ammo

#define scr_fading
//reduce alpha when not live
if (!live) image_alpha-=0.05;
if image_alpha<0 instance_destroy();

#define scr_locked_or_unlocked
///Check If Unlocked - Goto Shop If OK
if global.level>=my_id
{
    locked=false;
}
else 
{
    locked=true;
}
if locked
{  
    image_index=0;
}
else
{
    image_index=1;
}
if (!locked && position_meeting(mouse_x, mouse_y, id) && mouse_check_button_released(mb_left))
{
    global.my_level=my_id;
    room_goto(room_shop);
}

#define scr_msg
//add message to a ds list
ds_list_add(global.message,argument0);

#define scr_play_effect
//plays a sound effect
audio_play_sound(argument0,2,0);

#define scr_set_menu_text
//this script sets drawing font, alignment and colour
draw_set_font(font_shop);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

#define scr_shop_set_text
//this script sets drawing font, alignment and colour
draw_set_font(font_shop);
draw_set_colour(c_red);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

#define scr_spawn
//Create an asteroid, x,y,asteroid,my_health,my_starting_health,min rotate, max rotate,
//direction,speed min, speed max
var asteroid=instance_create(argument0,argument1,argument2); 
asteroid.my_health=argument3; 
asteroid.my_starting_health=argument4; 
i=irandom_range(argument5,argument6); 
asteroid.rotate=choose(i,-i); 
asteroid.direction=argument7; 
asteroid.speed=irandom_range(argument8,argument9);

#define scr_target
//Find a nearest
return instance_nearest(argument0,argument1,argument2);

#define scr_voice
//play a voice sound effect]
audio_play_sound(argument0,1,0);

