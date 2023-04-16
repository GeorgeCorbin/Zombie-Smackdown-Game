/// @description Insert description here
// You can write your code in this editor

if global.purchase_price <= global.points and global.purchase != ""
		and (global.purchase_wall_section != 0 or !instance_exists(obj_buymenu.details_inst)) {
	global.points -= global.purchase_price
	
	var wall_height = room_height / global.number_walls
	var section = global.purchase_wall_section - 1
	var scale_factor = wall_height / sprite_get_height(spr_fence)
	
// Walls

	if global.purchase == "Fence" {
		if global.wall_section[section] != 0 and instance_exists(global.wall_section[section]) {
			instance_destroy	(global.wall_section[section])
		}		
		var inst = instance_create_depth(global.wall_x, (section + 0.5) * wall_height, 50, obj_fence)
		inst.image_yscale = scale_factor
		global.wall_section[section] = inst
		
	} else if global.purchase == "Wood Wall" {
		if global.wall_section[section] != 0 and instance_exists(global.wall_section[section]) {
			instance_destroy(global.wall_section[section])
		}
		var inst = instance_create_depth(global.wall_x, (section + 0.5) * wall_height, 50, obj_wood)
		inst.image_yscale = scale_factor
		global.wall_section[section] = inst	
		
	} else if global.purchase == "Corrugated Metal" {
		if global.wall_section[section] != 0 and instance_exists(global.wall_section[section]) {
			instance_destroy(global.wall_section[section])
		}
		var inst = instance_create_depth(global.wall_x, (section + 0.5) * wall_height, 50, obj_corrugatedmetal)
		inst.image_yscale = scale_factor
		global.wall_section[section] = inst	
		
	} else if global.purchase == "Steel Slats" {
		if global.wall_section[section] != 0 and instance_exists(global.wall_section[section]) {
			instance_destroy(global.wall_section[section])
		}
		var inst = instance_create_depth(global.wall_x, (section + 0.5) * wall_height, 50, obj_steelslats)
		inst.image_yscale = scale_factor
		global.wall_section[section] = inst	
		
	} else if section != 0 and global.purchase == "Concrete Wall" {
		if global.wall_section[section] != 0 and instance_exists(global.wall_section[section]) {
			instance_destroy(global.wall_section[section])
		}
		var inst = instance_create_depth(global.wall_x, (section + 0.5) * wall_height, 50, obj_concretewall)
		inst.image_yscale = scale_factor
		global.wall_section[section] = inst	

// Weapons		
	} else if global.purchase == "Pistol" {
		global.player.sprite_index = spr_playerpistol
		global.player.magazine_size = 13
		global.player.number_bullets = global.player.magazine_size
		global.player.total_bullets = 52
		global.player.firing_rate = .75
		global.player.automatic_firing = false
		global.player.bullet_strength = 1
		 
	} else if global.purchase == "MP5" {
		global.player.sprite_index = spr_playermp5
		global.player.magazine_size = 24
		global.player.number_bullets = global.player.magazine_size
		global.player.total_bullets = 96
		global.player.firing_rate = .15
		global.player.automatic_firing = true
		global.player.bullet_strength = 0.8
		 
	} else if global.purchase == "AK-47" {
		global.player.sprite_index = spr_playerak47
		global.player.magazine_size = 30
		global.player.number_bullets = global.player.magazine_size
		global.player.total_bullets = 120
		global.player.firing_rate = .18
		global.player.automatic_firing = true
		global.player.bullet_strength = 2
		 
	} else if global.purchase == "Mini-Gun" {
		global.player.sprite_index = spr_playerminigun
		global.player.magazine_size = 100
		global.player.number_bullets = global.player.magazine_size
		global.player.total_bullets = 400
		global.player.firing_rate = .05
		global.player.automatic_firing = true
		global.player.bullet_strength = 1
		
	} else if global.purchase == "Ammo" {
		global.player.total_bullets += global.player.magazine_size
	
	// else do nothing
	}
	instance_destroy(obj_buymenu)
	instance_activate_object(obj_player)
	window_set_cursor(cr_none)
	instance_activate_object(obj_scope)
	instance_destroy(obj_button)
	instance_destroy(obj_buybutton)
	instance_destroy(obj_wallselectbutton)
	obj_buy.buymenu_open = false
	
	audio_play_sound(sfx_puchasebuttongame, 0, false)
	
}
global.purchase_wall_section = 0
