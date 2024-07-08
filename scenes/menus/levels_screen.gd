extends Control

func _ready():
	for control in $CanvasLayer/LevelsContainer.get_children():
		if control is TextureButton and control.disabled:
			control.modulate = "48484888"

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func _on_level_1_button_pressed():
	Globals.level_name = "res://scenes/levels/paper_doll/paper_doll_level_data.tscn"	
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")

func _on_level_2_button_pressed():
	Globals.level_name = "res://scenes/levels/school/school_level_data.tscn"
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")

func _on_level_3_button_pressed():
	Globals.level_name = "res://scenes/levels/school/school_level_data.tscn"
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")

func _on_level_4_button_pressed():
	Globals.level_name = "res://scenes/levels/paper_doll/paper_doll_level_data.tscn"
	get_tree().change_scene_to_file("res://scenes/level/level.tscn")
	#OS.alert("Ain't done this yet, yo", 'Nope')
	#alert("This isn't implemented yet", "TBD")

	
## This works but wipes out your level when it's done.
func alert(text: String, title: String='Message'):
	var dialog = AcceptDialog.new()
	dialog.dialog_text = text
	dialog.title = title
	#dialog.connect(dialog, "canceled", queue_free)
	#dialog.confirmed.connect(dialog, queue_free)
	add_child(dialog)
	dialog.popup_centered()
