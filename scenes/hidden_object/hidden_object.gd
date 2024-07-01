class_name HiddenObject extends TextureButton

#@export var image : Texture2D
#@export var mask : Texture2D
#@export var display_name : String

signal discovered(name: String)

func _ready():
	#$TextureButton.texture_normal = image
	#$TextureButton.texture_click_mask = mask
	pivot_offset = Vector2(size.x/2, size.y/2)
	pass
	
func on_discovered():
	emit_signal("discovered", name)
	# TODO: outline
	# TODO: grow
	# TODO: fadeout
	#queue_free()
	var initial_scale = scale
	var max_scale = initial_scale + 1
	var tweener = get_tree().create_tween()
	tweener.tween_property(self, "scale", max_scale, 1.0)
	tweener.tween_property(self, "scale", initial_scale, 1.0)
	tweener.tween_property(self, "modulate", Color.GRAY, 1.0)
