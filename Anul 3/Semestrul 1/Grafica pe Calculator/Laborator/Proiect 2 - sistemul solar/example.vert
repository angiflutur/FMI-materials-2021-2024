#version 330 core

layout(location=0) in vec3 in_Position;
layout(location=1) in vec3 in_Normal;
layout(location=2) in vec2 texCoord;
out vec4 gl_Position;
out vec3 Normal;
out vec3 FragPos;
out vec3 inLightPos;
out vec3 inViewPos;
out vec2 tex_Coord;
uniform mat4 matrUmbra;
uniform mat4 myMatrix;
uniform mat4 view;
uniform mat4 projection;
uniform vec3 lightPos;
uniform vec3 viewPos;
uniform int codCol;
void main(void)
{
	if (codCol == 0)
	{
		gl_Position = projection*view*myMatrix*vec4(in_Position, 1.0);
		Normal=vec3(projection*view*vec4(in_Normal,0.0));
		inLightPos= vec3(projection*view*vec4(lightPos, 1.0f));
		inViewPos=vec3(projection*view*vec4(viewPos, 1.0f));
		FragPos = vec3(gl_Position);
	}
	if (codCol == 1)
	{
		gl_Position = projection*view*matrUmbra*myMatrix*vec4(in_Position, 1.0);
		FragPos = vec3(gl_Position);
	}
	if (codCol == 2)
	{
		gl_Position = projection*view*myMatrix*vec4(in_Position, 1.0);
		Normal=vec3(projection*view*vec4(in_Normal,0.0));
		tex_Coord = vec2(Normal.x, Normal.y);
	}
}
