extends Control

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		#get_tree().change_scene_to_file("res://main_menu.tscn")
		_on_quit_button_pressed()

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_level_1_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1/level_01.tscn")
