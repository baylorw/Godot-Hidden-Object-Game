extends Control

@onready var score_label : Label = $MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/ScoreLabel
var score := 0
var max_score := 10
var crossout_color := Color(.2,.2,.2,.5)

func discover(hidden_object):
	# TODO: outline
	# TODO: grow
	# TODO: fadeout
	#queue_free()
	
	score += 1
	score_label.text = "Score: " + str(score) + " / " + str(max_score)
	$AudioStreamPlayer2D.play()
	
	hidden_object.disabled = true # no more pressing that button
	var initial_scale = hidden_object.scale
	var max_scale = initial_scale + Vector2(0.2, 0.2)
	var tweener = get_tree().create_tween()
	tweener.tween_property(hidden_object, "scale", max_scale, .125)
	tweener.tween_property(hidden_object, "scale", initial_scale, 0.125)
	tweener.tween_property(hidden_object, "modulate", Color(0.25, 0.25, 0.25), 0.25)
	
	if score == max_score:
		$WinLabel.visible = true
	
func _on_sports_pressed():
	print("you clicked on sports")
	discover($HiddenObjects/Sports)
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/GridContainer/Sports.modulate = crossout_color

func _on_liberal_arts_major_pressed():
	discover($HiddenObjects/LiberalArtsMajor)
	$"MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/GridContainer/Liberal Arts".modulate = crossout_color

func _on_pimp_pressed():
	discover($HiddenObjects/Pimp)
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/GridContainer/Pimp.modulate = crossout_color

func _on_rapper_pressed():
	discover($HiddenObjects/Rapper)
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/GridContainer/Rapper.modulate = crossout_color
	
func _on_goth_pressed():
	discover($HiddenObjects/Goth)
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/GridContainer/Goth.modulate = crossout_color
	
func _on_pirate_pressed():
	discover($HiddenObjects/Pirate)
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/GridContainer/Pirate.modulate = crossout_color
	
func _on_rich_person_pressed():
	discover($HiddenObjects/RichPerson)
	$"MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/GridContainer/Rich Person".modulate = crossout_color
	
func _on_ninja_pressed():
	discover($HiddenObjects/Ninja)
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/GridContainer/Ninja.modulate = crossout_color
	
func _on_emo_pressed():
	discover($HiddenObjects/Emo)
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/GridContainer/Emo.modulate = crossout_color
	
func _on_punk_pressed():
	discover($HiddenObjects/Punk)
	$MarginContainer2/PanelContainer/MarginContainer/VBoxContainer/GridContainer/Punk.modulate = crossout_color
	
func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://ui/levels_screen.tscn")

