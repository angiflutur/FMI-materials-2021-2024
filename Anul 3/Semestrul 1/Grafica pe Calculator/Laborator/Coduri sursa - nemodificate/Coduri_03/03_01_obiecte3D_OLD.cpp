//
// ================================================
// | Grafica pe calculator - Mihai Sorin Stupariu |
// ================================================
// | Laboratorul VI - 06_01_obiecte3D_OLD.cpp |
// ============================================
//
//	Program ce deseneaza mai multe obiecte 3D din biblioteca OpenGL, folosindu-se tehnicile OLD OpenGL;
//
//
//
//	Biblioteci

#include <windows.h>        //	utilizarea functiilor de sistem Windows (crearea de ferestre, manipularea fisierelor si directoarelor);
#include <GL/freeglut.h>    //	include functii pentru: 
							//	- gestionarea ferestrelor si evenimentelor de tastatura si mouse, 
							//  - desenarea de primitive grafice precum dreptunghiuri, cercuri sau linii, 
							//  - crearea de meniuri si submeniuri;

//	Dimensiunile ferestrei de afisare;
GLint winWidth = 600, winHeight = 600;
//	Parametri pentru gluLookAt() - vizualizare;
GLfloat x0 = 6.0, y0 = 9.0, z0 = 10.0;
GLfloat xRef = 0.0, yRef = 0.0, zRef = 0.0;
GLfloat Vx = 0.0, Vy = 0.0, Vz = 1.0;
//	Variabile pentru proiectia ortogonala;
GLfloat xMin = -20.0, yMin = -20.0, xMax = 20.0, yMax = 20.0, dNear = 1.0, dFar = 40.0;

//	Redimensionarea scenei la redimensionarea ferestrei de afisare;
void ReshapeFunction(GLint newWidth, GLint newHeight)
{
	glViewport(0, 0, newWidth, newHeight);

	winWidth = newWidth;
	winHeight = newHeight;
}

//  Setarea parametrilor necesari pentru fereastra de vizualizare
void Initialize(void)
{
	glClearColor (1.0, 1.0, 1.0, 0.0);						//  Culoarea de fond a ecranului;

	//	Vizualizare de catre observator:
	//	- situat la x0, y0, z0,
	//	- ce priveste catre xref, yref, zref,
	//	- are directia de vizualizare data de vectorii normali Vx, Vy, Vz;
	glMatrixMode (GL_MODELVIEW);
	gluLookAt (x0, y0, z0, xRef, yRef, zRef, Vx, Vy, Vz);

	// Decupare;
	glMatrixMode(GL_PROJECTION);							//	Se precizeaza ca are loc o reprezentare 2D, realizata prin proiectie ortogonala;
	glOrtho(xMin, xMax, yMin, yMax, dNear, dFar);			//  Sunt indicate coordonatele extreme ale ferestrei de vizualizare;
}

//  Functia de desenarea a graficii pe ecran;
void RenderFunction(void)
{
	glClear(GL_COLOR_BUFFER_BIT);		//  Se curata ecranul de vizualizare pentru a fi desenat noul continut;
	//	Desenare SFERA;
	glColor3f(0.0, 0.0, 1.0);
    glutWireSphere(8.0, 100, 10);

	//	Desenare CON;
	glColor3f(1.0, 0.0, 0.0);
	glPushMatrix();						//  Se translateaza CONUL - se adauga in matricea de transformare;
	glTranslatef(-15.0, 4.0, -20.0);	
	//	glPushMatrix();					//  Se scaleaza CONUL - se adauga in matricea de transformare;
	//	glScaled(2.2, 2.2, 2.2);
	glutWireCone(5.0, 10.0, 50, 70);
	glPopMatrix();						//	Se curata matricea pentru transformarile ulterioare - se elimina fiecare transformare in parte;
	//	glPopMatrix();
	
    //	Desenare TOR;
	glColor3f(0.0, 1.0, 0.0);
	glPushMatrix();						//  Se translateaza TORUL - se adauga in matricea de transformare;
    glTranslatef(-5.0, -10.0, -15.0);	
    glutWireTorus(3.0, 7.0, 40, 60);
	glPopMatrix ();						//	Se curata matricea pentru transformarile ulterioare;

	//	Desenare CEAINIC;
	glColor3f(1.0, 0.0, 1.0);
	glPushMatrix();						//  Se translateaza CEAINICUL - se adauga in matricea de transformare;
	glTranslatef(-5.0, 0.0, 0.0);
	glutWireTeapot(2.0);
	glPopMatrix();						//	Se curata matricea pentru transformarile ulterioare;

    //	Desenare CILINDRU;
	glColor3d(0.2, 0.0, 0.6);
	GLUquadricObj *cylinder;
	glPushMatrix();
	glTranslatef(-15.0, 10.0, -18.0);	//  Se translateaza CILINDRUL - se adauga in matricea de transformare;
	cylinder = gluNewQuadric();
	gluQuadricDrawStyle (cylinder, GLU_SILHOUETTE);
	gluCylinder (cylinder, 3.0, 3.0, 5.0, 40, 20);
	glPopMatrix ();

	//	Desenarea AXELOR;
	glColor3f (0.0, 0.0, 0.0);
	//	Functia glBegin(arg) primeste un argument care specifica tipul primitiveloe desenate;
	//  Finalizarea desenarii primitivelor este marcata de glEnd;
	glBegin (GL_LINES);
		glVertex3i (0, 0, 0);
		glVertex3i (20, 0, 0);
		glVertex3i (0, 0, 0);
		glVertex3i (0, 20, 0);
		glVertex3i (0, 0, 0);
		glVertex3i (0, 0, 20);
	glEnd ( );

	glFlush();	//  Asigura rularea tuturor comenzilor OpenGL apelate anterior;
}

//	Punctul de intrare in program, se ruleaza rutina OpenGL;
int main(int argc, char** argv)
{
	//  Se initializeaza GLUT si contextul OpenGL si se configureaza fereastra si modul de afisare;

	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);			//	Modul de afisare al ferestrei, se foloseste un singur buffer de afisare si culori RGB;
	glutInitWindowPosition(50, 50);							//  Pozitia initiala a ferestrei;
	glutInitWindowSize(winWidth, winHeight);				//  Dimensiunea ferestrei;
	glutCreateWindow("Obiecte 3D - OpenGL <<vechi>>");		//	Creeaza fereastra de vizualizare, indicand numele acesteia;

	Initialize();						//  Setarea parametrilor necesari pentru fereastra de vizualizare; 

	glutDisplayFunc(RenderFunction);	//  Desenarea scenei in fereastra;
	glutReshapeFunc(ReshapeFunction);	//	Redimensionarea scenei la redimensionarea ferestrei de afisare;
	//  Bucla principala de procesare a evenimentelor GLUT (functiile care incep cu glut: glutInit etc.) este pornita;
	//  Prelucreaza evenimentele si deseneaza fereastra de vizualizare pana cand utilizatorul o inchide;

	glutMainLoop();

	return 0;
}

