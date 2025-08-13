varying vec2 v_vTexcoord;

uniform vec3 palette_LUT[8];

void main(){
	ivec3 index = ivec3(texture2D(gm_BaseTexture, v_vTexcoord).rgb + vec3(0.5));
    gl_FragColor = vec4(palette_LUT[index.r + 2*index.g + 4*index.b], 1.0);
}
