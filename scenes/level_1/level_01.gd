extends Control

@onready var score_label : Label = $ItemsToFindUI/PanelContainer/MarginContainer/VBoxContainer/ScoreLabel
@onready var hidden_objects = %HiddenObjects

var score := 0
var max_score := 10
var crossout_color := Color(.2,.2,.2,.5)

func _ready():
	$WinLabel.visible = false
	#--- Need to know when our objects are found.
	for hidden_object : HiddenObject in hidden_objects.get_children():
		hidden_object.discovered.connect(_on_hidden_object_discovered)
	
func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://ui/levels_screen.tscn")

func _on_hidden_object_discovered(object_name: String):
	for label : RichTextLabel in %ItemsToFindContainer.get_children():
		if object_name == label.name:
			label.modulate = crossout_color
			#label.text = "[color=gray][s]" + label.text + "[/s][/color]"
			label.parse_bbcode("[color=gray][s]" + label.text + "[/s][/color]")

	$AudioStreamPlayer2D.play()
	score += 1
	score_label.text = "Score: " + str(score) + " / " + str(max_score)
	if score == max_score:
		$WinLabel.visible = true
