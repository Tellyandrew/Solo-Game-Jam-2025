varying vec2 v_vTexcoord;

uniform vec3 palette_LUT[8];

void main(){
	ivec3 index3 = ivec3(texture2D(gm_BaseTexture, v_vTexcoord).rgb + vec3(0.5));
	if (index3 == ivec3(0, 0, 0)){
		gl_FragColor = vec4(palette_LUT[0], 1.0);
	}else if (index3 == ivec3(1, 0, 0)){
		gl_FragColor = vec4(palette_LUT[1], 1.0);
	}else if (index3 == ivec3(0, 0, 1)){
		gl_FragColor = vec4(palette_LUT[4], 1.0);
	}else if (index3 == ivec3(0, 1, 1)){
		gl_FragColor = vec4(palette_LUT[6], 1.0);
	}else{
		gl_FragColor = vec4(palette_LUT[7], 1.0);
	}
	
	//gl_FragColor = vec4(palette_LUT[index.r + 2*index.g + 4*index.b], 1.0);
}
