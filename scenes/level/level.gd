extends Control

@onready var score_label : RichTextLabel = %ScoreLabel
@onready var item_labels = %ItemsToFindContainer
@onready var rtf_label_prototype : RichTextLabel = $prototypes/RichTextLabelPrototype

const crossout_color := Color(.2,.2,.2,.5)

var hidden_objects
var objects_to_find : Array[HiddenObject]
var score := 0
var max_score := 10

func _ready():
	# TODO: Make Win message a PopupPanel.
	$WinLabel.visible = false
	#$WinMessagePopupPanel.visible = true
	#$WinMessagePopupPanel.initial_position = Window.WINDOW_INITIAL_POSITION_CENTER_PRIMARY_SCREEN

	if "" == Globals.level_name:
		Globals.level_name = "res://scenes/levels/paper_doll/paper_doll_level_data.tscn"
	var packed_scene = load(Globals.level_name)
	if (null == packed_scene):
		print("Globals.level_name was blank or an invalid file")
		assert(packed_scene)
	var play_area = packed_scene.instantiate()
	#--- Adding to a specific node to put it in the middle of the tree rather than at the end
	#---	where it would block the Win message.
	%PlayArea.add_child(play_area)
	hidden_objects = %PlayArea/LevelData/HiddenObjects.get_children()
	#--- Create button masks.
	#--- Do it for all objects, not just the ones you can click on. 
	#---	Why? Don't know but it breaks all but the last 2 hidden objects.
	for hidden_object in hidden_objects:
		create_click_mask(hidden_object)
		
	max_score = min(max_score, hidden_objects.size())
	update_score_display()
	
	objects_to_find = pick_objects_to_find()
	show_objects_to_find_names(objects_to_find)
		
	#--- Turn off the objects we aren't looking for, hookup with the ones we are.
	for hidden_object : HiddenObject in hidden_objects:
		hidden_object.disabled = true
	for hidden_object : HiddenObject in objects_to_find:
		hidden_object.disabled = false
		#create_click_mask(hidden_object)
		hidden_object.discovered.connect(_on_hidden_object_discovered)

func _unhandled_input(event):
	if event.is_action_pressed("zoom_in"):
		$Camera2D.zoom += Vector2(0.1, 0.1)
	elif event.is_action_pressed("zoom_out"):
		$Camera2D.zoom -= Vector2(0.1, 0.1)

func create_click_mask(hidden_object : HiddenObject):
	print("creating click mask for " + hidden_object.name)
	var normal : Texture2D = hidden_object.texture_normal
	if null == normal:
		print(hidden_object.name + " normal texture is null")
	
	if null != hidden_object.texture_click_mask:
		print("~~~ " + hidden_object.name + " already has a mask")
		#--- Let them keep the custom mask. It's probably better.
		return
		
	var image = hidden_object.texture_normal.get_image()
	var bitmap = BitMap.new()
	#bitmap.create_from_image_alpha(image, 0.05)
	bitmap.create_from_image_alpha(image)
	hidden_object.texture_click_mask = bitmap

func mark_item_name_discovered(object_name: String):
	for label : RichTextLabel in %ItemsToFindContainer.get_children():
		if object_name == label.name:
			#label.modulate = crossout_color
			label.modulate.a = 0.5
			label.parse_bbcode("[color=maroon][s]" + label.name + "[/s][/color]")
	
func _on_hidden_object_discovered(object_name: String):
	$AudioStreamPlayer2D.play()
	mark_item_name_discovered(object_name)
	score += 1
	update_score_display()
	if score == max_score:
		$WinLabel.visible = true
	
func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/levels_screen.tscn")

func pick_objects_to_find() -> Array[HiddenObject]:
	var candidates = hidden_objects.duplicate()
	var selected : Array[HiddenObject] = []
	candidates.shuffle()
	for i in max_score:
		selected.push_back(candidates.pop_back())
	return selected

func show_objects_to_find_names(objects : Array[HiddenObject]):
	#--- Clear any old/placeholder values
	for label in item_labels.get_children():
		label.queue_free()
	for object in objects:
		var label := rtf_label_prototype.duplicate()
		label.parse_bbcode(object.name)
		label.name = object.name
		item_labels.add_child(label)

func update_score_display():
	score_label.parse_bbcode("Score: " + str(score) + " / " + str(max_score))
