varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D original;
uniform lowp sampler2D text;

void main() {
	float pixels = 2500.0;
	float dy = 16.0 / pixels;
	float dx = 9.0 / pixels;
	float gdy = 16.0 / (pixels * 10.0);
	float gdx = 9.0 / (pixels * 10.0);

	vec2 coord = vec2(dx * floor(var_texcoord0.x / dx) + dx*0.5, dy * floor(var_texcoord0.y / dy) + dy*0.5);
	vec2 gcoord = vec2(gdx * floor(var_texcoord0.x / gdx) + gdx*0.5, gdy * floor(var_texcoord0.y / gdy) + gdy*0.5);
	
	vec4 color = texture2D(original, coord);
	vec4 t = texture2D(text, gcoord);
	vec4 gui = texture2D(text, gcoord);
	if (t.x > 0.0 || t.y > 0.0 || t.z > 0.0){
		color = t;
	}
	
	gl_FragColor = color;
}