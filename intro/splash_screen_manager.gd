extends Control

@export var next_screen : PackedScene

@onready var _splash_screen_container : CenterContainer = $SplashScreenContainer

var _splash_screens : Array[SplashScreen]

func _ready():
	#set_process_input(false) # Don't press skip before it's ready
	for splash_screen in _splash_screen_container.get_children():
		splash_screen.hide()
		_splash_screens.push_back(splash_screen)
	#await get_tree().create_timer(1).timeout
	_start_splash_screen()
	#set_process_input(true)

func _start_splash_screen():
	if _splash_screens.is_empty():
		get_tree().change_scene_to_packed(next_screen)
	else:
		var splash_screen = _splash_screens.pop_front()
		splash_screen.start()
		#--- Call this method when we finish. i don't like that.
		splash_screen.finished.connect(_start_splash_screen)
		
func _input(event):
	if event.is_action_pressed("ui_skip"):
	#if Input.is_action_just_pressed("ui_skip"):
		_skip()

func _skip():
	if (0 == _splash_screen_container.get_child_count()):
		return
	_splash_screen_container.get_child(0).queue_free()
	_start_splash_screen()
