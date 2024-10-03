#include "civil.hpp"
#include "proces.hpp"
//constructor fara parametri
ProcesCivil::ProcesCivil(): Proces(), dauneMorale(0), dauneMateriale(0), nrMartori(0), stadiu(0)
{
}
//constructor cu parametri
ProcesCivil::ProcesCivil(double dauneMorale, double dauneMateriale, int nrMartori) : Proces(nrProces, reclamant, reclamat)
{
    this->dauneMorale = dauneMorale;
    this->dauneMateriale = dauneMateriale;
    this->nrMartori = nrMartori;
    if(nrMartori > 5)
        this->stadiu = 1;
    else
        this->stadiu = 0;
}
//constructor de copiere
ProcesCivil::ProcesCivil(const ProcesCivil& obj) : Proces(obj)
{

    this->dauneMorale = obj.dauneMorale;
    this->dauneMateriale = obj.dauneMateriale;
    this->nrMartori = obj.nrMartori;

    if(this->nrMartori > 5)
        this->stadiu = 1;
    else
        this->stadiu = 0;
}
//destructor
ProcesCivil::~ProcesCivil()
{
    //nu este nevoie, nu avem alocari dinamice
}
//Getteri
double ProcesCivil::GetDauneMorale()
{
    return this->dauneMorale;
}

double ProcesCivil::GetDauneMateriale()
{
    return this->dauneMateriale;
}

int ProcesCivil::GetNrMartori()
{
    return this->nrMartori;
}

bool ProcesCivil::GetStadiu()
{
    return this->stadiu;
}
//Setteri
void ProcesCivil::SetDauneMorale(double dauneMorale)
{
    this->dauneMorale = dauneMorale;
}
void ProcesCivil::SetDauneMateriale(double dauneMateriale)
{
    this->dauneMateriale = dauneMateriale;
}
void ProcesCivil::SetNrMartori(int nrMartori)
{
    this->nrMartori = nrMartori;
}
void ProcesCivil::SetStadiu(bool stadiu)
{
    this->stadiu = stadiu;
}
ProcesCivil& ProcesCivil::operator=(const ProcesCivil& obj)
{
    Proces::operator=(obj);
    this->dauneMorale = obj.dauneMorale;
    this->dauneMateriale = obj.dauneMateriale;
    this->nrMartori = obj.nrMartori;
    if(obj.nrMartori>5)
        this->stadiu = 1;
    else
        this->stadiu = 0;
    return *this;
}
ostream& operator<<(ostream& out,const ProcesCivil& obj)
{
    out<<"\n\n Proces civil \n";
    out<<(Proces&)obj;
    out<<" daune morale: "<<obj.dauneMorale<<std::endl;
    out<<" daune materiale: "<<obj.dauneMateriale<<std::endl;
    out<<" nr martori: "<<obj.nrMartori<<std::endl;

    if(obj.nrMartori > 5)
    out<<" stadiu: "<<1<<std::endl;
    else
    out<<" stadiu: "<<0<<std::endl;
    return out;
}
istream& operator>>(istream& in,ProcesCivil& obj)
{
    cout<<"\n Proces civil";
    in>>(Proces&)obj;
    cout<<" daune morale: ";
    in>>obj.dauneMorale;
    cout<<" daune materiale: ";
    in>>obj.dauneMateriale;
    cout<<" nr martori: ";
    in>>obj.nrMartori;

    return in;
}
// functii virtuale
void ProcesCivil::citire()
{
    cout<<endl;
    cout<<" Proces civil \n";
    /**cout<<" nr proces: ";
    cin>>nrProces;
    cout<<" reclamant: ";
    cin>>reclamant;
    cout<<" reclamat: ";
    cin>>reclamat;*/
    cin>>(Proces&)obj;
    cout<<" daune morale: ";
    cin>>dauneMorale;
    cout<<" daune materiale: ";
    cin>>dauneMateriale;
    cout<<" nr martori: ";
    cin>>nrMartori;
    if(nrMartori>5)
        stadiu = 1;
    else
        stadiu = 0;
    cout<<" stadiu: "<<stadiu;

}
void ProcesCivil::afisare()
{
    cout<<" Proces civil\n";

    cout<<(Proces&)obj;
    cout<<" daune morale: "<<dauneMorale<<endl;
    cout<<" daune materiale: "<<dauneMateriale<<endl;
    cout<<" nr martori: "<<nrMartori<<endl;
    cout<<" stadiu: "<<stadiu<<endl;
}
// timbru
float ProcesCivil::TaxaTimbru()
{
    return (10*this->dauneMorale/100 + 10*this->dauneMateriale/100);
}
