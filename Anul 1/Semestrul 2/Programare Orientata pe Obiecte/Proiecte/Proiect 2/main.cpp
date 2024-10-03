#include<iostream>
#include<vector>
#include "proces.hpp"
#include "civil.hpp"
#include "penal.hpp"
void meniu()
{
    vector<Proces*> procese; //upcasting
    ProcesCivil *ProcesC, *ProcesC_aux;
    ProcesPenal *ProcesP, *ProcesP_aux;

    ProcesC = nullptr;
    ProcesC_aux = nullptr;
    ProcesP = nullptr;
    ProcesP_aux = nullptr;

    int nrProceseCivile = 0;
    int nrProcesePenale = 0;
    int comanda = -1;

    while(comanda != 0)
    {
        cout<<endl;
        cout<<"\n                   Meniu \n";
        cout<<" 0. Iesire"<<endl;
        cout<<" 1. Citire si afisare a n procese"<<endl;
        cout<<" 2. Testare getteri, setteri"<<endl;
        cout<<" 3. Testare operatori >>, <<, ="<<endl;
        cout<<" 4. Afisare proces civil cu timbrul cel mai mare"<<endl;
        cout<<" 5. Testare functii virtuale"<<endl;
        cin>>comanda;
        int tip = 0;
        if(comanda == 0)
            break;
        else if(comanda == 1)
        {
            cout<<"   Tip proces: "<<endl;
            cout<<" 1. Proces civil"<<endl;
            cout<<" 2. Proces penal"<<endl;

            tip = 0;
            cin>>tip;
            while(tip < 1 || tip>2)
            {
                cout<<" Comanda: ";
                cin>>tip;
                if(tip!=1 || tip!=2)
                    cout<<" Tip proces invalid. Mai incercati."<<endl;
            }
            if(tip == 1)
            {
                cout<<" Numarul de procese civile: ";
                cin>>nrProceseCivile;
                ProcesC = new ProcesCivil[nrProceseCivile];

                for(int i = 0; i<nrProceseCivile; i++)
                {
                    cout<<" Detalii procesul "<<i+1<<endl;
                    ProcesCivil *procesCivil = new ProcesCivil();
                    cin>>ProcesC[i];
                    *procesCivil = ProcesC[i];
                    //procese.push_back(procesCivil); //upcasting
                }
                cout<<"\n Afisare procese\n";
                for(int i = 0; i< nrProceseCivile; i++)
                    cout<<ProcesC[i]<<" ";
                cout<<endl;
            }
            else
            {
                cout<<" Numarul de procese penale: ";
                cin>>nrProcesePenale;
                ProcesP = new ProcesPenal[nrProcesePenale];

                for(int i = 0; i<nrProcesePenale; i++)
                {
                    cout<<" Detalii procesul "<<i+1<<endl;
                    ProcesPenal *procesPenal = new ProcesPenal();
                    cin>>ProcesP[i];
                    *procesPenal = ProcesP[i];
                    procese.push_back(procesPenal); //upcasting
                }
                cout<<"\n Afisare procese\n";
                for(int i = 0; i< nrProcesePenale; i++)
                    cout<<ProcesP[i]<<" ";
                cout<<endl;
            }
            /**cout<<" Afisare elemente/upcasting\n";
                for(int i=0; i<procese.size(); i++)
                    cout<<*procese[i]<<endl;
                break;*/

        }
        else if (comanda == 2) //testare setteri, getteri
        {
            cout<<"   Tip proces: "<<endl;
            cout<<" 1. Proces civil"<<endl;
            cout<<" 2. Proces penal"<<endl;

            tip = 0;
            cin>>tip;
            while(tip < 1 || tip>2)
            {
                cout<<" Comanda: ";
                cin>>tip;
                if(tip!=1 || tip!=2)
                    cout<<" Tip proces invalid. Mai incercati."<<endl;
            }
            if(tip == 1)
            {
                ProcesCivil p;
                double dauna;
                int martori;
                int nr;
                string pers;
                cout<<" SET nr proces: ";
                cin>>nr;
                p.SetNrProces(nr);

                cout<<" SET reclamant: ";
                cin>>pers;
                p.SetReclamant(pers);

                cout<<" SET reclamant: ";
                cin>>pers;
                p.SetReclamat(pers);

                cout<<" SET daune morale: ";
                cin>>dauna;
                p.SetDauneMorale(dauna);

                cout<<" SET daune materiale: ";
                cin>>dauna;
                p.SetDauneMateriale(dauna);


                cout<<" SET nr martori: ";
                cin>>martori;
                p.SetNrMartori(martori);

                cout<<" SET tara: ";
                cin>>pers;
                p.SetTara(pers);

                cout<<"\n Voi face afisarea cu ajutorul getterilor. \n";
                cout<<" nr proces = "<<p.GetNrProces()<<endl;
                cout<<" reclamant = "<<p.GetReclamant()<<endl;
                cout<<" reclamat = "<<p.GetReclamat()<<endl;
                cout<<" daune morale = "<<p.GetDauneMorale()<<endl;
                cout<<" daune materiale = "<<p.GetDauneMateriale()<<endl;
                cout<<" nr martori = "<<p.GetNrMartori()<<endl;
                cout<<" stadiu = "<<p.GetStadiu()<<endl;
                cout<<" tara = "<<p.GetTara()<<endl;

            }
            else if(tip == 2)
            {
                ProcesPenal p;
                double dauna;
                int martori;
                int nr;
                string pers;
                cout<<" SET nr proces: ";
                cin>>nr;
                p.SetNrProces(nr);

                cout<<" SET reclamant: ";
                cin>>pers;
                p.SetReclamant(pers);

                cout<<" SET reclamant: ";
                cin>>pers;
                p.SetReclamat(pers);

                cout<<" SET dovezi: ";
                cin>>nr;
                p.SetDovezi(nr);

                cout<<" SET tara: ";
                cin>>pers;
                p.SetTara(pers);

                cout<<"\n Voi face afisarea cu ajutorul getterilor. \n";
                cout<<" nr proces = "<<p.GetNrProces()<<endl;
                cout<<" reclamant = "<<p.GetReclamant()<<endl;
                cout<<" reclamat = "<<p.GetReclamat()<<endl;
                cout<<" nr dovezi = "<<p.GetDovezi()<<endl;
                cout<<" stadiu = "<<p.GetStadiu()<<endl;
                cout<<" tara = "<<p.GetTara()<<endl;
            }
        }
        else if(comanda == 3) //testare <<, >>, =
        {
            cout<<"   Tip proces: "<<endl;
            cout<<" 1. Proces civil"<<endl;
            cout<<" 2. Proces penal"<<endl;

            tip = 0;
            cin>>tip;
            while(tip < 1 || tip>2)
            {
                cout<<" Comanda: ";
                cin>>tip;
                if(tip!=1 || tip!=2)
                    cout<<" Tip proces invalid. Mai incercati."<<endl;
            }
            if(tip == 1)
            {
                ProcesCivil p1, p2;
                cout<<" P1 = ";
                cin>>p1;
                cout<<" P2 = ";
                cin>>p2;
                cout<<"\n Efectuam p1 = p2. \n";
                cout<<" P1 initial = ";
                cout<<p1;
                p1 = p2;
                cout<<"\n P1 dupa egalare = ";
                cout<<p2;
            }
            else if(tip == 2)
            {
                ProcesPenal p1, p2;
                cout<<" P1 = ";
                cin>>p1;
                cout<<" P2 = ";
                cin>>p2;
                cout<<"\n Efectuam p1 = p2. \n";
                cout<<" P1 initial = ";
                cout<<p1;
                p1 = p2;
                cout<<"\n P1 dupa egalare = ";
                cout<<p2;
            }
        }
        else if(comanda == 4)
        {
            cout<<" Numarul de procese civile: ";
            cin>>nrProceseCivile;
            ProcesC = new ProcesCivil[nrProceseCivile];
            float maxi = -1;
            for(int i = 0; i<nrProceseCivile; i++)
            {
                cout<<endl;
                cout<<" Detalii procesul "<<i+1;
                ProcesCivil *procesCivil = new ProcesCivil();
                cin>>ProcesC[i];
                *procesCivil = ProcesC[i];
                if(ProcesC[i].TaxaTimbru()>maxi)
                    maxi = ProcesC[i].TaxaTimbru();
                //procese.push_back(procesCivil); //upcasting
            }
            cout<<"\n Timbrul cel mai mare = "<< maxi;
            cout<<"\n Procesul cu timbrul cel mai mare\n";
            for(int i = 0; i< nrProceseCivile; i++)
                if(ProcesC[i].TaxaTimbru() == maxi)
                    cout<<ProcesC[i];
            cout<<endl;
        }
        else if(comanda == 5)
        {
            cout<<"   Tip proces: "<<endl;
            cout<<" 1. Proces civil"<<endl;
            cout<<" 2. Proces penal"<<endl;

            tip = 0;
            cin>>tip;
            while(tip < 1 || tip>2)
            {
                cout<<" Comanda: ";
                cin>>tip;
                if(tip!=1 || tip!=2)
                    cout<<" Tip proces invalid. Mai incercati."<<endl;
            }
            if(tip == 1)
            {
                ProcesCivil p;
                p.citire();
                cout<<endl;
                p.afisare();
            }
            else if(tip == 2)
            {
                ProcesPenal p;
                p.citire();
                cout<<endl;
                p.afisare();
            }
        }
        else cout<<" Comanda invalida"<<endl;
    }
    cout<<" Iesire program";
}
using namespace std;
int main()
{
    char comanda;
    cout<<" Introduceti y pentru a porni sau n pentru a iesi: ";
    cin>>comanda;
    while(toupper(comanda) != 'Y')
    {
        if(toupper(comanda) == 'N')
            return 0;
        else
        {
            cout<<" Comanda invalida"<<endl;
        }
        cout<<" Introduceti y pentru a porni sau n pentru a iesi: ";
        cin>>comanda;
    }
    meniu();
    /**
    // downcasting
    cout<<endl;
    cout<<endl;
    cout<<" Verificare downcasting\n";

    ProcesCivil *ProcesC = new ProcesPenal();
    if(ProcesCivil *p ==dynamic_cast<ProcesPenal*>(ProcesC))
        cout<<*p;
    else
        cout<<" Nu are loc downcasting-ul.";*/
    return 0;
}

