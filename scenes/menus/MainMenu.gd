extends Control

func _on_levels_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/levels_screen.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

