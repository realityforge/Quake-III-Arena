uniform sampler2D u_TextureMap;

uniform vec4      u_Color;

uniform vec2      u_InvTexRes;
varying vec2      var_TexCoords;

void main()
{
	vec4 color;
	vec2 tc;

	float c[5];

	c[0] = 1.0;
	c[1] = 0.9238795325;
	c[2] = 0.7071067812;
	c[3] = 0.3826834324;
	c[4] = 0.0;

	tc = var_TexCoords + u_InvTexRes * vec2(  c[0],  c[4]);  color =  texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2(  c[1],  c[3]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2(  c[2],  c[2]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2(  c[3],  c[1]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2(  c[4],  c[0]);  color += texture2D(u_TextureMap, tc);

	tc = var_TexCoords + u_InvTexRes * vec2(  c[1], -c[3]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2(  c[2], -c[2]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2(  c[3], -c[1]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2(  c[4], -c[0]);  color += texture2D(u_TextureMap, tc);

	tc = var_TexCoords + u_InvTexRes * vec2( -c[0],  c[4]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2( -c[1],  c[3]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2( -c[2],  c[2]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2( -c[3],  c[1]);  color += texture2D(u_TextureMap, tc);

	tc = var_TexCoords + u_InvTexRes * vec2( -c[1], -c[3]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2( -c[2], -c[2]);  color += texture2D(u_TextureMap, tc);
	tc = var_TexCoords + u_InvTexRes * vec2( -c[3], -c[1]);  color += texture2D(u_TextureMap, tc);
	
	gl_FragColor = color * 0.0625 * u_Color;
}
