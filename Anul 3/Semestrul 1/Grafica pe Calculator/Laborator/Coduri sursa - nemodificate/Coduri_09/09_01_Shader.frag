//
// ================================================
// | Grafica pe calculator                        |
// ================================================
// | Laboratorul IX - 09_01_Shader.frag  |
// =======================================
// 
//  Shaderul de fragment / Fragment shader - afecteaza culoarea pixelilor;
//

#version 330 core

//	Variabile de intrare (dinspre Shader.vert);
in vec3 ex_Color; 

//	Variabile de iesire	(spre programul principal);
out vec3 out_Color;

void main(void)
{
    out_Color=ex_Color;  
}