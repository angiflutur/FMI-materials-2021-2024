//
// ==================================================
// | Grafica pe calculator                          |
// ==================================================
// | Laboratorul II - 02_05_poligoane3D_ex2_OLD.cpp |
// ==================================================
//
//	Program ce deseneaza poligoane din spatiul 3D vazute din fata si din spate, folosindu-se tehnicile OLD OpenGL;
//  ELEMENTE DE NOUTATE:
//	- indicarea varfurilor in vectori,
//  - utilizarea mouselui;
//
//
//	Biblioteci

#include <windows.h>        //	utilizarea functiilor de sistem Windows (crearea de ferestre, manipularea fisierelor si directoarelor);
#include <GL/freeglut.h>    //	include functii pentru: 
							//	- gestionarea ferestrelor si evenimentelor de tastatura si mouse, 
							//  - desenarea de primitive grafice precum dreptunghiuri, cercuri sau linii, 
							//  - crearea de meniuri si submeniuri;

//	Dimensiunea ferestrei de vizualizare;
GLint winWidth = 600, winHeight = 600;

//	Parametri pentru gluLookAt() - vizualizare;
GLfloat x0 = 13.0, y0 = 11.0, z0 = 14.0;
GLfloat xref = 3.0, yref = 1.0, zref = 4.0;
GLfloat Vx = 8.0, Vy = 0.0, Vz = -8.0;

//	Parametri pentru glOrtho() - decupare;
GLfloat xMin = -10.0, yMin = -10.0, xMax = 10.0, yMax = 10.0, dNear = 0.0, dFar = 20.0;

//	Coordonatele varfurilor;
int p1[] = { 6, 2, 0 };
int p2[] = { -4, 4, 8 };
int p3[] = { 0, 0, 8 };
int p4[] = { 2, 2, 4 };
int p5[] = { 10, -2, 0 };

//  Setarea parametrilor necesari pentru fereastra de vizualizare
void Initialize(void)
{
	glClearColor(1.0, 1.0, 1.0, 0.0);		//  Culoarea de fond a ecranului;

	//	Vizualizare de catre observator:
	//	- situat la x0, y0, z0,
	//	- ce priveste catre xref, yref, zref,
	//	- are directia de vizualizare data de vectorii normali Vx, Vy, Vz;
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();										//	Reinitializeaza matricea de transformare cu matricea identica,
	gluLookAt(x0, y0, z0, xref, yref, zref, Vx, Vy, Vz);	// astfel la CLICK stanga/dreapta transformarile se reiau de la 0;	

	// Decupare;
	glMatrixMode(GL_PROJECTION);							//	Se precizeaza ca are loc o reprezentare 2D, realizata prin proiectie ortogonala;
	glLoadIdentity();										
	glOrtho(xMin, xMax, yMin, yMax, dNear, dFar);       //  Sunt indicate coordonatele extreme ale ferestrei de vizualizare;
}

// Functia 1 de desenarea a graficii pe ecran - poligonul p1p2p3p4;
void RenderFunction1(void)
{
	glClear(GL_COLOR_BUFFER_BIT);		//  Se curata ecranul de vizualizare pentru a fi desenat noul continut;

	//	Setarea parametrilor privind fata/spatele poligoanelor;
	glPolygonMode(GL_FRONT, GL_FILL);	//	Poligon cu fata => umplere;
	glPolygonMode(GL_BACK, GL_LINE);	//	Poligon cu spatele => contur;
	glLineWidth(6.0);					//  Se seteaza dimensiunea liniilor;

	//  Functia glBegin(arg) primeste un argument care specifica tipul primitiveloe desenate;
	//  Finalizarea desenarii primitivelor este marcata de glEnd;
	//  EXERCITIU: de schimbat ordinea intre p3 si p4;
	glBegin(GL_POLYGON);
		glColor3f(1.0, 0.0, 0.0);
		glVertex3iv(p1);
		glColor3f(0.0, 1.0, 0.0);
		glVertex3iv(p2);
		glColor3f(0.0, 0.0, 1.0);
		glVertex3iv(p4);
		glColor3f(1.0, 1.0, 0.0);
		glVertex3iv(p3);
	glEnd();

	glFlush();	//  Asigura rularea tuturor comenzilor OpenGL apelate anterior;
}

//	Functia 2 de desenarea a graficii pe ecran - poligonul p1p2p3p5;
void RenderFunction2(void)
{
	glClear(GL_COLOR_BUFFER_BIT);		//  Se curata ecranul de vizualizare pentru a fi desenat noul continut;

	//	Setarea parametrilor privind fata/spatele poligoanelor;
	glPolygonMode(GL_FRONT, GL_FILL);	//	Poligon cu fata => umplere;
	glPolygonMode(GL_BACK, GL_LINE);	//	Poligon cu spatele => contur;
	glLineWidth(6.0);					//  Se seteaza dimensiunea liniilor;

	glBegin(GL_POLYGON);
		glColor3f(1.0, 0.0, 0.0);
		glVertex3iv(p1);
		glColor3f(0.0, 1.0, 0.0);
		glVertex3iv(p2);
		glColor3f(0.0, 0.0, 1.0);
		glVertex3iv(p3);
		glColor3f(1.0, 1.0, 0.0);
		glVertex3iv(p5);
	glEnd();

	glFlush();
}

//	Functie ce modifica pozitia observatorului in functie de apasarea butoanelor de pe mouse;
void UseMouse(int button, int state, int x, int y)
{
	switch (button) {
	case GLUT_LEFT_BUTTON:			//	CLICK stanga => observatorul se muta in fata poligonului;
		if (state == GLUT_DOWN)
			x0 = 13.0, y0 = 11.0, z0 = 14.0;
		Initialize();				//	Se reinitializeaza contextul OpenGL => redesenarea scenei;
		break;
	case GLUT_RIGHT_BUTTON:			//	CLICK dreapta => observatorul se muta in spatele poligonului;
		if (state == GLUT_DOWN)
			x0 = -7.0, y0 = -9.0, z0 = -6.0;
		Initialize();				//	Se reinitializeaza contextul OpenGL => redesenarea scenei;
		break;
	}
}

//	Punctul de intrare in program, se ruleaza rutina OpenGL;
int main(int argc, char** argv)
{
	//  Se initializeaza GLUT si contextul OpenGL si se configureaza fereastra si modul de afisare;

	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);					//	Modul de afisare al ferestrei, se foloseste un singur buffer de afisare si culori RGB;
	glutInitWindowPosition(50, 50);									//  Pozitia initiala a ferestrei;
	glutInitWindowSize(winWidth, winHeight);						//  Dimensiunea ferestrei;
	glutCreateWindow("Poligoane in context 3D - OpenGL <<vechi>>");	//	Creeaza fereastra de vizualizare, indicand numele acesteia;

	Initialize();									//  Setarea parametrilor necesari pentru fereastra de vizualizare; 

		glutDisplayFunc(RenderFunction1);			//  Desenarea scenei in fereastra; 
	//	Decomentati urmatoarele 2 linii si comentati-o pe cea anterioara pentru un nou rezultat;
	//	glutDisplayFunc(RenderFunction2);
	//	glutMouseFunc(UseMouse);
	
	//  Bucla principala de procesare a evenimentelor GLUT (functiile care incep cu glut: glutInit etc.) este pornita;
	//  Prelucreaza evenimentele si deseneaza fereastra de vizualizare pana cand utilizatorul o inchide;

	glutMainLoop();

	return 0;
}
