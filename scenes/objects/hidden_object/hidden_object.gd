class_name HiddenObject extends TextureButton

signal discovered(object_name: String)

func _ready():
	#--- We want it to grow on click but not move so we need to center the pivot point.
	pivot_offset = Vector2(size.x/2, size.y/2)
	pressed.connect(on_pressed)
	
func on_pressed():
	react_to_being_discovered()
	
func react_to_being_discovered():
	print("we've been discovered. " + name)
	emit_signal("discovered", name)
	self.disabled = true # no more pressing my button!

	#--- Let the user know we've been found.
	#var initial_scale = self.scale
	#var max_scale = initial_scale + Vector2(0.2, 0.2)
	var tweener = get_tree().create_tween()
	#--- This doesn't work if we use untrimmed textures since the pivot point 
	#---	won't be the center of the drawn part.
	#tweener.tween_property(self, "scale", max_scale, .125)
	#tweener.tween_property(self, "scale", initial_scale, 0.125)
	#tweener.tween_property(self, "modulate", Color(0.25, 0.25, 0.25), 0.25)
	#tweener.tween_property(self, "modulate", Color.YELLOW, 0.25)
	tweener.tween_property(self, "modulate:a", 0.0, 0.15)
	await tweener.finished
	
	#--- With a real image we'd delete ourselves but my demo has the same image
	#---	in the background so that won't work. 
	queue_free()
