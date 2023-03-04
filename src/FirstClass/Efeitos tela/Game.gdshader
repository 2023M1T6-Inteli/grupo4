shader_type canvas_item;

uniform vec4 ColorChange : hint_color;
uniform float Opacity : hint_range(0,1) = 0;
uniform float Distorcion : hint_range(0,3) = 0;

void fragment() {
	vec2 waveUV = UV;
	
	if(Distorcion != 0.0){
	waveUV.x += sin( TIME + waveUV.y * Distorcion ) * 0.05 ;
	waveUV.y += cos( TIME + waveUV.y * (Distorcion * (-1.0) - 1.0)) *   0.05 ;
	}
	 
	COLOR = texture(TEXTURE,waveUV);
	COLOR.rgb = mix(COLOR,ColorChange,Opacity).rgb;
}