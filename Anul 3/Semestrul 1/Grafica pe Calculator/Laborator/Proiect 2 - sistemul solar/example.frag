#version 330 core


in vec3 FragPos;
in vec3 Normal;
in vec3 inLightPos;
in vec3 inViewPos;
in vec2 tex_Coord;
out vec4 out_Color;
uniform vec3 objectColor;
uniform vec3 lightColor;
uniform int codCol;
uniform sampler2D myTexture;
void main(void)
{
	if (codCol==0)
	{
		// Ambient
		float ambientStrength = 0.1f;
		vec3 ambient_light = ambientStrength * lightColor;
		vec3 ambient_term= ambient_light * objectColor;
		// Diffuse
		vec3 norm = normalize(Normal);
		vec3 lightDir = normalize(inLightPos - FragPos);
		float diff = max(dot(norm, lightDir), 0.0);
		vec3 diffuse_light = lightColor;
		vec3 diffuse_term = diff * diffuse_light * objectColor;
		// Specular
		float specularStrength = 0.8f;
		float shininess = 100.0f;
		vec3 viewDir = normalize(inViewPos - FragPos);
		vec3 reflectDir = normalize(reflect(-lightDir, norm));
		float spec = pow(max(dot(viewDir, reflectDir), 0.0), shininess);
		vec3 specular_light = specularStrength * lightColor;
		vec3 specular_term = spec * specular_light * objectColor;
		// Culoarea finala
		vec3 emission=vec3(0.0, 0.0, 0.0);
		vec3 result = emission + (ambient_term + diffuse_term + specular_term);
		out_Color = vec4(result, 1.0f);
	}
	if (codCol==1)
	{
		vec3 black = vec3(0.0, 0.0, 0.0);
		out_Color = vec4(black, 1.0);
	}
	if (codCol==2)
	{
		// Culoare cu ambient
		float ambientStrength = 1.0f;
		vec3 ambient_light = ambientStrength * lightColor;
		vec3 ambient_term= ambient_light * objectColor;
		// Culoarea finala
		vec3 emission = vec3(0.0,0.0,0.0);
		vec3 result = emission + (ambient_term);
		out_Color = vec4(result, 1.0f);
		out_Color = mix(texture(myTexture, tex_Coord), out_Color, 0.2);
	}
}
