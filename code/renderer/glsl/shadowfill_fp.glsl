uniform vec4  u_LightOrigin;
uniform float u_LightRadius;

varying vec3  var_Position;

void main()
{
#if defined(USE_DEPTH)
	float depth = length(u_LightOrigin.xyz - var_Position) / u_LightRadius;
	// 24 bit precision
	const vec3 bitSh = vec3( 256 * 256,         256,           1);
	const vec3 bitMsk = vec3(        0, 1.0 / 256.0, 1.0 / 256.0);
	
	vec3 comp;
	comp = depth * bitSh;
	comp.xy = fract(comp.xy);
	comp -= comp.xxy * bitMsk;
	gl_FragColor = vec4(comp, 1.0);
#else
	gl_FragColor = vec4(0, 0, 0, 1);
#endif
}
