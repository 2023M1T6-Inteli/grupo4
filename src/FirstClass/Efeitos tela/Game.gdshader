shader_type canvas_item;

uniform float Distorcion : hint_range(0,1) = 0;

void fragment() {
	vec2 waveUV = UV;
	waveUV.x += (sin( TIME + waveUV.y * 6.0 ) * 0.05) * Distorcion;
	waveUV.y += (cos( TIME + waveUV.y * -5.0 - 1.0) *   0.05) * Distorcion ;
	 
	COLOR = texture(TEXTURE,waveUV);
}