#include "penal.hpp"
//constructor fara parametri
ProcesPenal::ProcesPenal(): Proces(), dovezi(0), stadiu(0)
{
}
//constructor cu parametri
ProcesPenal::ProcesPenal(int dovezi) : Proces(nrProces, reclamant, reclamat)
{
    this->dovezi = dovezi;
    if(dovezi > 25)
        this->stadiu = 1;
    else
        this->stadiu = 0;
}
//constructor de copiere
ProcesPenal::ProcesPenal(const ProcesPenal& obj) : Proces(obj)
{
    this->dovezi = obj.dovezi;
    if(this->dovezi > 25)
        this->stadiu = 1;
    else
        this->stadiu = 0;
}
//destructor
ProcesPenal::~ProcesPenal()
{
    //nu este nevoie, nu avem alocari dinamice
}
//Getteri
int ProcesPenal::GetDovezi()
{
    return this->dovezi;
}
bool ProcesPenal::GetStadiu()
{
    return this->stadiu;
}
//Setteri
void ProcesPenal::SetDovezi(int dovezi)
{
    this->dovezi = dovezi;
}
void ProcesPenal::SetStadiu(bool stadiu)
{
    this->stadiu = stadiu;
}
ProcesPenal& ProcesPenal::operator=(const ProcesPenal& obj)
{
    Proces::operator=(obj);
    this->dovezi = obj.dovezi;
    if(obj.dovezi>25)
        this->stadiu = 1;
    else
        this->stadiu = 0;
    return *this;
}
ostream& operator<<(ostream& out,const ProcesPenal& obj)
{
    out<<"\n Proces penal";
    out<<(Proces&)obj;
    out<<" dovezi: "<<obj.dovezi<<std::endl;
    if(obj.dovezi > 5)
        out<<" stadiu: "<<1<<std::endl;
    else
        out<<" stadiu: "<<0<<std::endl;
    return out;
}
istream& operator>>(istream& in,ProcesPenal& obj)
{
    cout<<"\n Proces penal ";
    in>>(Proces&)obj;
    cout<<" dovezi: ";
    in>>obj.dovezi;
    return in;
}
// functii virtuale
void ProcesPenal::citire()
{
    cout<<endl;
    cout<<" Proces penal \n";
//    cin>>(Proces&)obj;
    cout<<" dovezi: ";
    cin>>dovezi;
    if(dovezi>25)
        stadiu = 1;
    else
        stadiu = 0;
    cout<<" stadiu: "<<stadiu;

}
void ProcesPenal::afisare()
{
    cout<<" Proces penal \n";

 //   cout<<(Proces&)obj;
    cout<<" dovezi: "<<dovezi<<endl;
    cout<<" stadiu: "<<stadiu<<endl;
}


