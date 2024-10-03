#ifndef CIVIL_HPP
#define CIVIL_HPP
#include<iostream>
#include "proces.hpp"

class ProcesCivil : public Proces
{
private:
    double dauneMorale;
    double dauneMateriale;
    int nrMartori;
    bool stadiu;
    /**static string tara;*/
public:
    ProcesCivil();                    //constructor fara parametri
    ProcesCivil(double, double, int);   //constructor cu parametri
    ProcesCivil(const ProcesCivil&);       //constructor de copiere
    ~ProcesCivil();                   //destructor

    // Getteri si Setteri
    double GetDauneMorale();
    double GetDauneMateriale();
    int GetNrMartori();
    bool GetStadiu();

    void SetDauneMorale(double);
    void SetDauneMateriale(double);
    void SetNrMartori(int);
    void SetStadiu(bool);


    //Operatori
    ProcesCivil& operator=(const ProcesCivil&);
    friend ostream& operator<<(ostream&,const ProcesCivil&);
    friend istream& operator>>(istream&,ProcesCivil&);

    // functii virtuale
    void citire();
    void afisare();

    //timbru
    float TaxaTimbru();
};

#endif // CIVIL_HPP

