#ifndef PENAL_HPP
#define PENAL_HPP
#include<iostream>
#include "proces.hpp"

class ProcesPenal : public Proces
{
private:
    int dovezi;
    bool stadiu;

public:
    ProcesPenal();                    //constructor fara parametri
    ProcesPenal(int);   //constructor cu parametri
    ProcesPenal(const ProcesPenal&);       //constructor de copiere
    ~ProcesPenal();                   //destructor

    // Getteri si Setteri
    int GetDovezi();
    bool GetStadiu();

    void SetDovezi(int);
    void SetStadiu(bool);


    //Operatori
    ProcesPenal& operator=(const ProcesPenal&);
    friend ostream& operator<<(ostream&,const ProcesPenal&);
    friend istream& operator>>(istream&,ProcesPenal&);

    // functii virtuale
    void citire();
    void afisare();
};

#endif // CIVIL_HPP

