//
// ================================================
// | Grafica pe calculator                        |
// ================================================
// | Laboratorul IV - 04_03_Shader.frag |
// ======================================
// 
//  Shaderul de fragment / Fragment shader - afecteaza culoarea pixelilor;
//

#version 330 core

//	Variabile de intrare (dinspre Shader.vert);
in vec4 ex_Color;
in vec2 tex_Coord;		//	Coordonata de texturare;

//	Variabile de iesire	(spre programul principal);
out vec4 out_Color;		//	Culoarea actualizata;

//  Variabile uniforme;
uniform sampler2D myTexture;
uniform int codCol;


void main(void)
{
  switch (codCol)
  {
	case 0: 
	  out_Color = ex_Color;
	  break;
	case 1: 
		//out_Color=vec4(1.0,0.0,0.0,1.0); //red
		out_Color = texture(myTexture, tex_Coord);
		break;
	case 2:
		out_Color = texture(myTexture, tex_Coord);
		break;
	case 3:
		out_Color = mix(texture(myTexture, tex_Coord), ex_Color, 0.5);	//	Amestecarea texturii si a culorii;
		break;
	case 4:
		 out_Color = mix(texture(myTexture, tex_Coord), ex_Color, 0.2);	// textura benzi
		 break;
	case 5:
		 out_Color = mix(texture(myTexture, tex_Coord), ex_Color, 0.2);	// textura iarba
		 break;
	case 6:
		out_Color = mix(texture(myTexture, tex_Coord), ex_Color, 0.2);	// textura banca
		break;
	default:
		out_Color = ex_Color;
		break;
  };
}