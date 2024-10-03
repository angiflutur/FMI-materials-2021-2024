#ifndef PROCES_HPP
#define PROCES_HPP
#include <iostream>
using namespace std;

class Proces
{
protected:
    int nrProces;
    string reclamant;
    string reclamat;
    static string tara; //variabila statica
public:
    Proces();                    //constructor fara parametri
    Proces(int,string,string);   //constructor cu parametri
    Proces(const Proces&);       //constructor de copiere
    ~Proces();                   //destructor

    // Getteri si Setteri
    int GetNrProces();
    string GetReclamant();
    string GetReclamat();

    void SetNrProces(int);
    void SetReclamant(string);
    void SetReclamat(string );

    static string GetTara();
    static void SetTara(string); //functii statice

    //Operatori
    Proces& operator=(const Proces&);
    friend ostream& operator<<(ostream&,const Proces&);
    friend istream& operator>>(istream&,Proces&);

    // functii virtuale
    virtual void citire();
    virtual void afisare();

};

#endif // PROCES_HPP

