shader_type canvas_item;

uniform float speed = 1.0;
//uniform sampler2D line_texture;

void fragment() {
	vec2 new_UV = mod(UV - vec2(TIME * speed,0), 1);
	COLOR = texture(TEXTURE, new_UV);
	//COLOR = texture(line_texture, new_UV);
}