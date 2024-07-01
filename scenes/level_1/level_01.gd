extends Control

func discover(hidden_object):
	# TODO: outline
	# TODO: grow
	# TODO: fadeout
	#queue_free()
	#pass
	var initial_scale = hidden_object.scale
	var max_scale = initial_scale 
	max_scale.x += 3
	max_scale.y += 3
	var tweener = get_tree().create_tween()
	#tweener.tween_property(hidden_object, "scale", max_scale, 1.0)
	#tweener.tween_property(hidden_object, "scale", initial_scale, 1.0)
	tweener.tween_property(hidden_object, "modulate", Color(0.169, 0.169, 0.169), 0.25)

#func set_values_and_animate(value:String, color:Color, start_pos:Vector2, height:float, spread:float):
	#label.text = value
	#label.modulate = color 
	#
	#var tweener = get_tree().create_tween()
	#var end_pos = Vector2(randf_range(-spread, spread), -height) + start_pos
	#var tween_length = animation_player.get_animation("grow_and_fade").length
	#
	#animation_player.play("grow_and_fade")
	#tweener.tween_property(label_container, "position", end_pos, tween_length).from(start_pos)
	
	
func _on_sports_pressed():
	print("you clicked on sports")
	discover($HiddenObjects/Sports)

func _on_liberal_arts_major_pressed():
	discover($HiddenObjects/LiberalArtsMajor)

func _on_pimp_pressed():
	discover($HiddenObjects/Pimp)

func _on_rapper_pressed():
	discover($HiddenObjects/Rapper)

func _on_goth_pressed():
	discover($HiddenObjects/Goth)

func _on_pirate_pressed():
	discover($HiddenObjects/Pirate)

func _on_rich_person_pressed():
	discover($HiddenObjects/RichPerson)

func _on_ninja_pressed():
	discover($HiddenObjects/Ninja)

func _on_emo_pressed():
	discover($HiddenObjects/Emo)

func _on_punk_pressed():
	discover($HiddenObjects/Punk)

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://ui/levels_screen.tscn")
