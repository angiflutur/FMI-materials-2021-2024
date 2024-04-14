//
// ================================================
// | Grafica pe calculator                        |
// ================================================
// | Laboratorul I - 01_04_poligoane_OLD.cpp |
// ===========================================
//
//	Program ce desenaza mai multe poligoane, folosindu-se tehnicile OLD OpenGL;
//
//
//	Biblioteci

#include <windows.h>        //	utilizarea functiilor de sistem Windows (crearea de ferestre, manipularea fisierelor si directoarelor);
#include <GL/freeglut.h>    //	include functii pentru: 
							//	- gestionarea ferestrelor si evenimentelor de tastatura si mouse, 
							//  - desenarea de primitive grafice precum dreptunghiuri, cercuri sau linii, 
							//  - crearea de meniuri si submeniuri;


//  Setarea parametrilor necesari pentru fereastra de vizualizare;
void Initialize(void)
{
	glClearColor (1.0, 1.0, 1.0, 0.0);		//  Culoarea de fond a ecranului;
	glMatrixMode(GL_PROJECTION);			//	Se precizeaza ca are loc o reprezentare 2D, realizata prin proiectie ortogonala;
	gluOrtho2D(0.0, 800.0, 0.0, 700.0);		//  Sunt indicate coordonatele extreme ale ferestrei de vizualizare;
}

//  Functia 1 de desenarea a graficii pe ecran;
void RenderFunction1(void)
{
	//	Toate primitivelele definite vor avea specificatiile de mai jos (culoare) pana la o noua schimbare a acestora;
	glColor3f(0.0, 0.0, 1.0);

	//	Dreptunghi - desenare directa;
	glRecti(20, 130, 140, 310); 
	 
    //	Poligon convex; Desenarea punctelor in 2D, coordonate valori intregi (2i);
	//  Functia glBegin(arg) primeste un argument care specifica tipul primitivei desenate - poligon;
	//  Finalizarea desenarii primitivei este marcata de glEnd;
	glColor3f(1.0, 0.0, 0.0);	//	Se schimba culoarea;
	glBegin(GL_POLYGON);  
		glVertex2i(0,0);
		glVertex2i(100, 10);
		glVertex2i(200, 120);
		glVertex2i(155, 290);
	glEnd();

    //	Evantai de triunghiuri;
	glColor3d(1.0, 0.0, 0.25);  //	Se schimba culoarea;
    glBegin(GL_TRIANGLE_FAN);
	    glVertex2i(250, 300);
        glVertex2i(50, 300);
	    glVertex2i(200, 350);
	    glVertex2i(250, 500);
	    glVertex2i(350, 200);
    glEnd();

   //	Reuniune de triunghiuri;
   glColor3d(1.0, 0.75, 0.25);  //	Se schimba culoarea;
       glBegin(GL_TRIANGLE_STRIP);
	   glVertex2i(650, 300);
       glVertex2i(450, 300);
	   glVertex2i(600, 350);
	   glVertex2i(650, 500);
	   glVertex2i(750, 200);
   glEnd();

   glFlush();	//  Asigura rularea tuturor comenzilor OpenGL apelate anterior;
}

//  Functia 2 de desenarea a graficii pe ecran;
void RenderFunction2(void)
{
	//	Toate primitivelele definite vor avea specificatiile de mai jos (culoare) pana la o noua schimbare a acestora;
	glColor3f(1,0,0);

	//	Dreptunghi - desenare directa;
	glRecti (300, 200, 400, 100);
	
	//	Desenearea unui dreptunghi asupra caruia se aplica tranformari: scalare si translatie;
	//	Se foloseste o matrice de de transformare in care se inmultesc pe rand valorile transformarilor in ordinea lor inversa, 
	// iar la final se inmulteste cu valoarea initiala a coordonatelor;
	glColor3f(1,1,0);
	glMatrixMode(GL_MODELVIEW);		//	Se defineste matricea de transformare;
	glPushMatrix();
	glTranslatef(-50.0, -70.0, 0.0);	//	Se translateaza dreptunghiul;
	glScalef(0.5, 2.0, 0.0);			//	Se scaleaza dreptunghiul;
	glRecti(500, 200, 600, 100);
	glPopMatrix();

	//	Desenare punct;
	glPointSize(4.0);
	glColor3f(0,0,0);
	glBegin(GL_POINTS);
		glVertex3f(40,20,0);
	glEnd();

	//	Desenare punct;
	glPointSize (8.0);
	glColor3f(0,0,0);
	glBegin(GL_POINTS);
		glVertex3f(10,20,0);
	glEnd();

	glFlush();	//  Asigura rularea tuturor comenzilor OpenGL apelate anterior;
}

//  Functia 3 de desenarea a graficii pe ecran - ilustreaza GL_POLYGON;
void RenderFunction3(void)
{
	//	Toate primitivelele definite vor avea specificatiile de mai jos (culoare) pana la o noua schimbare a acestora;
	glColor3f(0.0, 0.0, 1.0);

	//	Poligon concav / apelarea GL_POLYGON Desenarea punctelor in 2D, coordonate valori intregi (2i);
	//  Functia glBegin(arg) primeste un argument care specifica tipul primitivei desenate - poligon;
	//  Finalizarea desenarii primitivei este marcata de glEnd;
	//  Poligonul de mai jos NU este convex. Daca veti indica mai intai varful (140, 60) va aparea un alt desen
	glBegin(GL_POLYGON);
	glVertex2i(0, 0);
	glVertex2i(200, 0);
	glVertex2i(200, 200);
	glVertex2i(140, 60);
	glEnd();

	glFlush();	//  Asigura rularea tuturor comenzilor OpenGL apelate anterior;
}
//	Punctul de intrare in program, se ruleaza rutina OpenGL;
//	Pentru a se schimba functia de randare, se schimba argumentul glutDisplayFunc();
int main(int argc, char** argv)
{
	//  Se initializeaza GLUT si contextul OpenGL si se configureaza fereastra si modul de afisare;

	glutInit (&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);			//	Modul de afisare al ferestrei, se foloseste un singur buffer de afisare si culori RGB;
	glutInitWindowPosition(100, 100);						//  Pozitia initiala a ferestrei;
	glutInitWindowSize(800, 600);							//  Dimensiunea ferestrei;
	glutCreateWindow("Poligoane - OpenGL <<vechi>>");		//	Creeaza fereastra de vizualizare, indicand numele acesteia;

	Initialize();									//  Setarea parametrilor necesari pentru fereastra de vizualizare; 
	glClear(GL_COLOR_BUFFER_BIT);					//  Se curata ecranul de vizualizare pentru a fi desenat noul continut;
	glutDisplayFunc(RenderFunction1);				//  Desenarea scenei in fereastra; 
	//	SAU
	//	glutDisplayFunc(RenderFunction2);

	//	SAU 
	// 	glutDisplayFunc(RenderFunction3);

	//  Bucla principala de procesare a evenimentelor GLUT (functiile care incep cu glut: glutInit etc.) este pornita;
	//  Prelucreaza evenimentele si deseneaza fereastra de vizualizare pana cand utilizatorul o inchide;

	glutMainLoop();

	return 0;
}