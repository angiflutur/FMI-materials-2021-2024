//
// ==================================================
// | Grafica pe calculator                          |
// ==================================================
// | Laboratorul II - 02_03_poligoane3D_ex1_OLD.cpp |
// ==================================================
//
//	Program ce desenaza 2 patrate din spatiul 3D, unul vazut din fata, iar altul din spate, folosindu-se tehnicile OLD OpenGL;
//	ELEMENTE DE NOUTATE:
//	- GL_QUADS ca mod de trasare a primitivelor,
//	- functii specifice OpenGL "vechi":
//		- gluLookAt,
//		- glOrtho,
//		- glMatrixMode;
//	- sunt generate transformari pentru vizualizare 3D,
//	- glPolygonMode;
//
//
//	Biblioteci

#include <windows.h>        //	utilizarea functiilor de sistem Windows (crearea de ferestre, manipularea fisierelor si directoarelor);
#include <GL/freeglut.h>    //	include functii pentru: 
							//	- gestionarea ferestrelor si evenimentelor de tastatura si mouse, 
							//  - desenarea de primitive grafice precum dreptunghiuri, cercuri sau linii, 
							//  - crearea de meniuri si submeniuri;

//	Dimensiunea ferestrei de afisare;
GLint winWidth = 600, winHeight = 600;	

//	Parametri pentru gluLookAt() - vizualizare;
GLfloat x0 = 0.0, y0 = 0.0, z0 = 0.0;
GLfloat xref = 0.0, yref = 0.0, zref = 40.0;
GLfloat Vx = 0.0, Vy = 1.0, Vz = 0.0;

//	Parametri pentru glOrtho() - decupare;
GLfloat xMin = -20.0, yMin = -20.0, xMax = 20.0, yMax = 20.0, dNear = 0.0, dFar = 60.0;

//  Setarea parametrilor necesari pentru fereastra de vizualizare
void Initialize(void)
{
	glClearColor(1.0, 1.0, 1.0, 0.0);						//  Culoarea de fond a ecranului;

	//	Vizualizare de catre observator:
	//	- situat la x0, y0, z0,
	//	- ce priveste catre xref, yref, zref,
	//	- are directia de vizualizare data de vectorii normali Vx, Vy, Vz;
	glMatrixMode(GL_MODELVIEW);
	gluLookAt(x0, y0, z0, xref, yref, zref, Vx, Vy, Vz);

	// Decupare;
	glMatrixMode(GL_PROJECTION);							//	Se precizeaza ca are loc o reprezentare 2D, realizata prin proiectie ortogonala;
	glOrtho(xMin, xMax, yMin, yMax, dNear, dFar);			//  Sunt indicate coordonatele extreme ale ferestrei de vizualizare;
}

//  Functia 1 de desenarea a graficii pe ecran;
void RenderFunction1(void)
{
	glLineWidth(4.0);					//  Se seteaza dimensiunea liniilor;
	//	Setarea parametrilor privind fata/spatele poligoanelor;
	glPolygonMode(GL_FRONT, GL_FILL);	//	Poligon cu fata => umplere;
	glPolygonMode(GL_BACK, GL_LINE);	//	Poligon cu spatele => contur;

	//  Functia glBegin(arg) primeste un argument care specifica tipul primitiveloe desenate;
	//  Finalizarea desenarii primitivelor este marcata de glEnd;
	glBegin(GL_QUADS);
		//	Desenarea patratului rosu la z = 5;
		glColor3f(1.0, 0.0, 0.0);
		glVertex3i(5, -5, 5);
		glVertex3i(-5, -5, 5);
		glVertex3i(-5, 5, 5);
		glVertex3i(5, 5, 5);
		//	Desenarea patratului albastru la z =10;
		glColor3f(0.0, 0.0, 0.5);
		glVertex3i(3, 3, 10);
		glVertex3i(-3, 3, 10);
		glVertex3i(-3, -3, 10);
		glVertex3i(3, -3, 10);
	glEnd();

	glFlush();	//  Asigura rularea tuturor comenzilor OpenGL apelate anterior;
}

//  Functia 2 de desenarea a graficii pe ecran;
//	Elimina poligoanele care sunt vazute din fata cu glCull;
void RenderFunction2(void)
{
	glLineWidth(4.0);					//  Se seteaza dimensiunea liniilor;
	//	Setarea parametrilor privind fata/spatele poligoanelor;
	glPolygonMode(GL_FRONT, GL_FILL);	//	Poligon cu fata => umplere;
	glPolygonMode(GL_BACK, GL_LINE);	//	Poligon cu spatele => contur;
	glEnable(GL_CULL_FACE);				//	Nu se afiseaza poligoanele orientate cu fata spre vizualizator;
	glCullFace(GL_FRONT);

	glBegin(GL_QUADS);
		//	Desenarea patratului rosu la z = 5;
		glColor3f(1.0, 0.0, 0.0);
		glVertex3i(5, -5, 5);
		glVertex3i(-5, -5, 5);
		glVertex3i(-5, 5, 5);
		glVertex3i(5, 5, 5);
		//	Desenarea patratului albastru la z =10;
		glColor3f(0.0, 0.0, 0.5);
		glVertex3i(3, 3, 10);
		glVertex3i(-3, 3, 10);
		glVertex3i(-3, -3, 10);
		glVertex3i(3, -3, 10);
	glEnd();

	glFlush();	//  Asigura rularea tuturor comenzilor OpenGL apelate anterior;
}

//	Punctul de intrare in program, se ruleaza rutina OpenGL;
//	Pentru a se schimba functia de randare, se schimba argumentul glutDisplayFunc();
int main(int argc, char** argv)
{
	//  Se initializeaza GLUT si contextul OpenGL si se configureaza fereastra si modul de afisare;

	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);			//	Modul de afisare al ferestrei, se foloseste un singur buffer de afisare si culori RGB;
	glutInitWindowPosition(50, 50);							//  Pozitia initiala a ferestrei;
	glutInitWindowSize(winWidth, winHeight);				//  Dimensiunea ferestrei;
	glutCreateWindow("Poligoane 3D - OpenGL <<vechi>>");	//	Creeaza fereastra de vizualizare, indicand numele acesteia;
	
	Initialize();									//  Setarea parametrilor necesari pentru fereastra de vizualizare; 
	glClear(GL_COLOR_BUFFER_BIT);					//  Se curata ecranul de vizualizare pentru a fi desenat noul continut;
	glutDisplayFunc(RenderFunction1);				//  Desenarea scenei in fereastra; 
	//	SAU
	//	glutDisplayFunc(RenderFunction2);

	//  Bucla principala de procesare a evenimentelor GLUT (functiile care incep cu glut: glutInit etc.) este pornita;
	//  Prelucreaza evenimentele si deseneaza fereastra de vizualizare pana cand utilizatorul o inchide;

	glutMainLoop();

	return 0;
}

