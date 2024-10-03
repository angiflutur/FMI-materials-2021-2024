#include<iostream>
using namespace std;
class Multime
{
    int *v;
    int nr;
public:
    Multime(); ///constructor fara parametri
    Multime(int*, int); ///constructor cu parametri
    Multime(const Multime&); ///constructor de copiere
    ~Multime(); ///destructorul
    void Afisare() const;
    friend int* GetVector(const Multime&);
    friend int GetNr(const Multime&);
    friend void Set(Multime&, int*, int);
    friend void EliminareDuplicate(Multime&);
    friend std::istream &operator>>(std::istream &in, Multime&);
    friend std::ostream &operator<<(std::ostream &out, const Multime&);
    friend Multime operator+(const Multime&,const Multime&);
    friend Multime operator*(const Multime&, const Multime&);
    friend Multime operator-(const Multime&, const Multime&);
    Multime& operator=(const Multime&);
};

Multime::Multime()
{
    v = NULL;
    nr=0;
}
Multime::Multime(int* v, int nr)
{
    this->v = new int [nr];
    for (int i = 0; i < nr ; i++)
        this->v[i] = v[i];

    this->nr=nr;
}
Multime::Multime(const Multime &obj)
{
    v = new int[obj.nr];
    for(int i=0; i<obj.nr; i++)
        v[i]=obj.v[i];
    nr = obj.nr;
}
Multime::~Multime()
{
    if(v!=NULL)
        delete[] v;
}
void Multime::Afisare() const
{
    cout<<" Nr = "<<nr<<endl;
    cout<<" v: ";
    for(int i=0; i<nr; i++)
        cout<<v[i]<<" ";
}
void EliminareDuplicate(Multime& obj)
{
    for(int i=0; i<obj.nr-1; i++)
        for(int j=i+1; j<obj.nr; j++)
            if(obj.v[i]==obj.v[j])
            {
                for(int k=j; k<obj.nr-1; k++)
                    obj.v[k] = obj.v[k+1];
                obj.nr--;
                i--;
            }
}
int* GetVector(const Multime& obj)
{
    int *aux;
    aux = new int[obj.nr];
    for(int i=0; i<obj.nr; i++)
        aux[i] = obj.v[i];
    return aux;
}
int GetNr(const Multime& obj)
{
    return obj.nr;
}
void Set(Multime& obj, int* a, int n)
{
    if(obj.v != NULL)
        delete[] obj.v;
    obj.v = new int [n];
    for(int i=0; i<n; i++)
        obj.v[i] = a[i];
    obj.nr = n;
}
std::istream &operator>>(std::istream &in, Multime &obj)
{
    cout<<"\n Citire obiect \n nr = ";
    in>>obj.nr;
    obj.v = new int [obj.nr];
    for(int i=0; i<obj.nr; i++)
    {
        cout<<" v["<<i<<"] = ";
        in>>obj.v[i];
    }
    return in;
}
std::ostream &operator<<(std::ostream& out, const Multime& obj)
{
    out <<" nr: "<<obj.nr<<std::endl;
    if(obj.v != NULL)
    {
        out<<" v: ";
        for(int i=0; i<obj.nr; i++)
            out<<obj.v[i]<<" ";
    }
    else
        out<<" v=null"<<std::endl;
    return out;
}
Multime&Multime::operator=(const Multime& obj)
{
    if(v != NULL)
        delete[] v;
    if(obj.v==NULL)
        this->v = NULL;
    else
    {
        this->v = new int[obj.nr];
        for(int i=0; i<obj.nr; i++)
            this->v[i]=obj.v[i];
    }
    nr = obj.nr;
    return *this;
}
Multime operator+(const Multime& m1, const Multime& m2)
{
    for(int i=0; i<m1.nr-1; i++)
        for(int j=i+1; j<m1.nr; j++)
            if(m1.v[i]>m1.v[j])
            {
                int aux = m1.v[i];
                m1.v[i] = m1.v[j];
                m1.v[j] = aux;
            }
    for(int i=0; i<m2.nr-1; i++)
        for(int j=i+1; j<m2.nr; j++)
            if(m2.v[i]>m2.v[j])
            {
                int aux = m2.v[i];
                m2.v[i] = m2.v[j];
                m2.v[j] = aux;
            }
    int i=0, j=0, k=0;
    int *a;
    a = new int[m1.nr + m2.nr];
    Multime aux(a, m1.nr+m2.nr);
    while(i<m1.nr && j<m2.nr)
        if(m1.v[i] < m2.v[j])
        {
            aux.v[k] = m1.v[i];
            k++;
            i++;
        }
        else
        {
            aux.v[k] = m2.v[j];
            k++;
            j++;
        }
    if(i<=m1.nr)
        for(int p = i; p<m1.nr; p++)
        {
            aux.v[k] = m1.v[p];
            k++;
        }
    if(j<=m2.nr)
        for(int p=j; p<m2.nr; p++)
        {
            aux.v[k] = m2.v[p];
            k++;
        }
    return aux;
}
Multime operator*(const Multime& m1, const Multime& m2)
{
    for(int i=0; i<m1.nr-1; i++)
        for(int j=i+1; j<m1.nr; j++)
            if(m1.v[i]>m1.v[j])
            {
                int aux = m1.v[i];
                m1.v[i] = m1.v[j];
                m1.v[j] = aux;
            }
    for(int i=0; i<m2.nr-1; i++)
        for(int j=i+1; j<m2.nr; j++)
            if(m2.v[i]>m2.v[j])
            {
                int aux = m2.v[i];
                m2.v[i] = m2.v[j];
                m2.v[j] = aux;
            }
    int k = 0;
    for(int i=0; i<m1.nr; i++)
    {
        int ok = 0;
        if(m1.v[i] != m1.v[i-1])
            for(int j=0; j<m2.nr && ok == 0; j++)
                if(m1.v[i] == m2.v[j])
                {
                    ok = 1;
                    k++;
                }
    }
    int *a, p = 0;
    a = new int[k];
    Multime aux(a, k);
    for(int i=0; i<m1.nr; i++)
    {
        int ok = 0;
        if(m1.v[i] != m1.v[i-1])
            for(int j=0; j<m2.nr && ok == 0; j++)
                if(m1.v[i] == m2.v[j])
                {
                    ok = 1;
                    aux.v[p] = m1.v[i];
                    p++;
                }
    }
    return aux;
}
Multime operator-(const Multime& m1, const Multime& m2)
{
    for(int i=0; i<m1.nr-1; i++)
        for(int j=i+1; j<m1.nr; j++)
            if(m1.v[i]>m1.v[j])
            {
                int aux = m1.v[i];
                m1.v[i] = m1.v[j];
                m1.v[j] = aux;
            }
    for(int i=0; i<m2.nr-1; i++)
        for(int j=i+1; j<m2.nr; j++)
            if(m2.v[i]>m2.v[j])
            {
                int aux = m2.v[i];
                m2.v[i] = m2.v[j];
                m2.v[j] = aux;
            }
    int k = 0;
    for(int i=0; i<m1.nr; i++)
    {
        int ok = 0;
        if(m1.v[i] != m1.v[i-1])
            for(int j=0; j<m2.nr && ok == 0; j++)
                if(m1.v[i] == m2.v[j])
                {
                    ok = 1;
                    k++;
                }
    }
    int *a, p = 0;
    a = new int[m1.nr - k + 1];
    Multime aux(a, k);
    if(k!=aux.nr-1)
        for(int i=0; i<m1.nr; i++)
        {
            int ok = 0;
            if(m1.v[i] != m1.v[i-1])
                for(int j=0; j<m2.nr && ok == 0; j++)
                    if(m1.v[i] == m2.v[j])
                        ok = 1;
            if(ok==0)
            {
                aux.v[p] = m1.v[i];
                p++;
            }
        }
    else
    {
        aux.nr=0;
        aux.v=NULL;
    }
    return aux;
}

int main()
{
    int n, i;
    cout<<" n = ";
    cin>>n;
    cout<<" ---Testare constructor fara parametru, cin, cout:\n";
    Multime obj[n];
    for(i=0; i<n; i++)
    {
        cin>>obj[i];
        cout<<obj[i]<<endl;
    }
    cout<<" ---Testare constructor cu parametru:\n";
    int v[5];
    v[0] = 5;
    v[1] = 2;
    v[2] = 8;
    v[3] = 4;
    v[4] = 0;
    Multime obj1(v, 5);
    cout<<obj1<<endl;
    cout<<" ---Testate getteri:\n";
    cout<<GetNr(obj1)<<endl;
    for(int i=0; i<5; i++)
        cout<<GetVector(obj1)[i]<<" ";
    cout<<endl;
    cout<<" Testare setter:\n";
    int a[5];
    a[0]=31;
    a[1]=56;
    a[2]=89;
    a[3]=31;
    a[4]=56;
    Set(obj1,a, 5);
    cout<<obj1<<endl;
    cout<<" Testare EliminareDuplicate si Afisare:\n";
    EliminareDuplicate(obj1);
    obj1.Afisare();
    cout<<endl<<"--TESTARE +\n";
    a[0]=31;
    a[1]=423;
    a[2]=56;
    a[3]=28;
    Set(obj1,a, 4);
    cout<<" obj1 : \n";
    obj1.Afisare();
    int d[5];
    d[0]=31;
    d[1]=56;
    d[2]=89;
    d[3]=31;
    d[4]=14;
    Multime obj2(d, 5);
    cout<<"\n\n obj2 : \n";
    obj2.Afisare();
    cout<<endl<<endl<<" m :\n";
    Multime m;
    m = obj1-obj2;
    m.Afisare();
    cout<<endl<<endl;
    EliminareDuplicate(m);

    m.Afisare();

///    Tema 8. Clasa ”Multime” (multimi finite de numere intregi reprezentate ca tablouri unidimensionale)

///- membri privati pentru vectorul propriuzis si numarul de elemente;

///     - constructori pentru initializare si copiere;

///     - destructor (în cazul alocarii statice, se seteaza dimensiunea vectorului la zero,
///       iar în cazul alocarii dinamice, se dezaloca zona de memorie utilizata);

///     - metoda publica pentru transformare a unui vector in multime, prin eliminarea duplicatelor din respectivul vector;

///     - reuniune a doua multimi, implementata prin supraincarcarea operatorului +;

///     - intersectie a doua multimi, implementata prin supraincarcarea operatorului *;

///     - diferenta a doua multimi, implementata prin supraincarcarea operatorului -.

    return 0;
}
