class_name SplashScreen extends Control

@export var display_time_in_sec : float = 3
@export var fade_time_in_sec : float = 1

signal finished

func start():
	modulate.a = 0
	show()
	var tweener = get_tree().create_tween()
	tweener.finished.connect(_finish)
	tweener.tween_property(self, "modulate:a", 1, fade_time_in_sec)
	tweener.tween_interval(display_time_in_sec)
	tweener.tween_property(self, "modulate:a", 0, fade_time_in_sec)

func _finish():
	emit_signal("finished")
	queue_free()
