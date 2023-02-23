shader_type canvas_item;

uniform vec4 ColorChange : hint_color;
uniform float Opacity : hint_range(0,1) = 0;
uniform float Distorcion : hint_range(1,10) = 1;

void fragment() {
	vec2 waveUV = UV;
	waveUV.x += sin( TIME + waveUV.y * 6.0 ) * 0.05 ;
	waveUV.y += cos( TIME + waveUV.y * -5.0 - 1.0) *   0.05 ;
	 
	COLOR = texture(TEXTURE,waveUV);
	COLOR.rgb = mix(COLOR,ColorChange,Opacity).rgb;
}