#include "proces.hpp"

Proces::Proces() //constructor fara parametri
{
    nrProces = 0;
    reclamant = "";
    reclamat  = "";
}
Proces::Proces(int nr,string reclamat,string reclamant) //constructor cu parametri
{
    this->nrProces = nr;
    this->reclamant = reclamant;
    this->reclamat  = reclamat;
}
Proces::Proces(const Proces &obj) //constructor de copiere
{
    this->nrProces = obj.nrProces;
    this->reclamant = obj.reclamant;
    this->reclamat = obj.reclamat;
}
Proces::~Proces()          //destructor
{
//nu este nevoie, nu avem alocari dinamice
}
//Getteri
int Proces::GetNrProces()
{
    return this->nrProces;
}
string Proces::GetReclamant()
{
    return this->reclamant;
}
string Proces::GetReclamat()
{
    return this->reclamat;
}

//Setteri
void Proces::SetNrProces(int nr)
{
    this->nrProces = nr;
}
void Proces::SetReclamant(string reclamant)
{
    this->reclamant = reclamant;
}
void Proces::SetReclamat(string reclamat)
{
    this->reclamat = reclamat;
}
string Proces::GetTara()
{
    return tara;
}
string Proces::tara = "Romania";
void Proces::SetTara(string TARA)
{
    Proces::tara = TARA;
}
//operatori
Proces& Proces::operator=(const Proces& obj)
{
    this->nrProces = obj.nrProces;
    this->reclamant = obj.reclamant;
    this->reclamat = obj.reclamat;
    return *this;
}

ostream& operator<<(ostream& out,const Proces& obj)
{
    out<<" nr proces: ";
    out<<obj.nrProces<<std::endl;
    out<<" reclamant: "<<obj.reclamant<<std::endl;
    out<<" reclamat: "<<obj.reclamat<<std::endl;
    out<<" tara: "<<obj.tara<<std::endl;
    return out;
}
istream& operator>>(istream& in,Proces& obj)
{
    cout<<endl<<" nr proces: ";
    in>>obj.nrProces;
    cout<<" reclamant: ";
    in>>obj.reclamant;
    cout<<" reclamat: ";
    in>>obj.reclamat;
    cout<<" tara: ";
    in>>obj.tara;
    return in;
}
// functii virtuale
void Proces::citire()
{
    cout<<endl;
    cout<<" Proces \n";
    cout<<" nr proces: ";
    cin>>nrProces;
    cout<<" reclamant: ";
    cin>>reclamant;
    cout<<" reclamat: ";
    cin>>reclamat;
    cout<<" tara: ";
    cin>>tara;
}
void Proces::afisare()
{
    cout<<endl;
    cout<<" Proces \n";
    cout<< " nr proces: "<<nrProces<<endl;
    cout<<" reclamant: "<<reclamant<<endl;
    cout<<" reclamat: "<<reclamat<<endl;
    cout<<" tara: "<<tara<<endl;
}

