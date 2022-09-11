/*
 * Model rezolvare subiect colocviu 23/05/2022
 * timp 90 minute
 */

#include <iostream>
#include <vector>

using namespace std;

/* -------------------- TIMP SISTEM ------------------------ */
//pentru timpul sistemului am putea sa folosim doar membri si metode statice => clasa utility
//sau ar putea fi un bun exemplu de singleton
class SystemTime {
    static long time;
public:
    //clasa utility, nu avem nevoie de constructori sau atribuire
    SystemTime() = delete;
    SystemTime(const SystemTime&) = delete;
    SystemTime& operator=(const SystemTime&) = delete;

    static long GetTime();
    static void IncrementTime(long value);
};
long SystemTime::time = 0;

long SystemTime::GetTime() { return  time; }
void SystemTime::IncrementTime(long value) { time += value;}


/* -------------------- COD BILETE -------------------------- */
class Bilet {
    //pretul unui bilet nu se schimba, deci membrul pret este constant
    const float pret;
protected:
    //nu se va putea crea un bilet simplu in main
    Bilet(float pret); //constructor parametrizat
public:
    Bilet(const Bilet&) = default; //constructorul de copiere default este suficient
    Bilet& operator=(const Bilet&) = delete; //pretul este constant, nu se schimba in urma atribuirii
    virtual ~Bilet() {}
    float GetPret() const;
    friend ostream& operator<<(ostream&, const Bilet&);
};

Bilet::Bilet(float pret): pret(pret) {}
float Bilet::GetPret() const { return pret; }
ostream& operator<<(ostream& out, const Bilet& bilet) {
    out<<bilet.pret;
    return out;
}

class BiletSuprafata: public Bilet {
    static const float PRET_BILET_SUPRAFATA; //declaram pretul unui bilet suprafata, static (pt ca nu depinde de instanta, ci de clasa) si const (pentru ca nu se modifica)
public:
    BiletSuprafata();
    BiletSuprafata(const BiletSuprafata&) = default; //constructorul de copiere default este suficient
    BiletSuprafata& operator=(const BiletSuprafata&) = delete; //pretul este constant, nu se schimba in urma atribuirii
    ~BiletSuprafata() override = default; //destructorul default este suficient
    static float GetPretBiletSuprafata(); //metoda static pentru aflarea pretului oricarui bilet de suprafata
};
const float BiletSuprafata::PRET_BILET_SUPRAFATA = 2;

BiletSuprafata::BiletSuprafata(): Bilet(PRET_BILET_SUPRAFATA) {} //apelarea unui constructor parametrizat din baza
float BiletSuprafata::GetPretBiletSuprafata() { return PRET_BILET_SUPRAFATA; }

class BiletMetrou: public Bilet {
    static const float PRET_BILET_METROU; //declaram pretul unui bilet metrou, static (pt ca nu depinde de instanta, ci de clasa) si const (pentru ca nu se modifica)
public:
    BiletMetrou();
    BiletMetrou(const BiletMetrou&) = default; //constructorul de copiere default este suficient
    BiletMetrou& operator=(const BiletMetrou&) = delete; //pretul este constant, nu se schimba in urma atribuirii
    ~BiletMetrou() override = default; //destructorul default este suficient
    static float GetPretBiletMetrou(); //metoda static pentru aflarea pretului oricarui bilet de metrou
};
const float BiletMetrou::PRET_BILET_METROU = 2.5;

BiletMetrou::BiletMetrou(): Bilet(PRET_BILET_METROU) {} //apelarea unui constructor parametrizat din baza
float BiletMetrou::GetPretBiletMetrou() { return PRET_BILET_METROU; }

class BiletTranzit: public Bilet {
    static const float PRET_BILET_TRANZIT; //declaram pretul unui bilet de tranzit, static (pt ca nu depinde de instanta, ci de clasa) si const (pentru ca nu se modifica)
    static const long DURATA_VALABILITATE;
    long timestampCumparare;
public:
    BiletTranzit();
    BiletTranzit(const BiletTranzit&) = default; //constructorul de copiere default este suficient
    BiletTranzit& operator=(const BiletTranzit&) = delete; //pretul este constant, nu se schimba in urma atribuirii
    ~BiletTranzit() override = default; //destructorul default este suficient
    static float GetPretBiletTranzit(); //metoda static pentru aflarea pretului oricarui bilet de tranzit
    long GetTimestampCumparare() const;
    bool EsteExpirat() const;
};
const float BiletTranzit::PRET_BILET_TRANZIT = 3;
const long BiletTranzit::DURATA_VALABILITATE = 90;

BiletTranzit::BiletTranzit(): Bilet(PRET_BILET_TRANZIT) { //apelarea unui constructor parametrizat din baza
    timestampCumparare = SystemTime::GetTime(); //se salveaza timpul de la cumpararea biletului
}
float BiletTranzit::GetPretBiletTranzit() { return PRET_BILET_TRANZIT; }
long BiletTranzit::GetTimestampCumparare() const { return timestampCumparare; }
bool BiletTranzit::EsteExpirat() const { return SystemTime::GetTime() - timestampCumparare > DURATA_VALABILITATE; }


/* -------------------- COD CARDURI -------------------------- */
class TipBiletIlegal : public exception {
public:
    const char * what () const noexcept override {
        return "Nu se accepta acest tip de bilet";
    }
};

class Card {
protected:
    vector<Bilet*> bilete; //biletele disponibile pe card; upcasting, se pot retine orice tip de bilete
    string tipUltimulBiletFolosit;
    long timpUltimaValidare = 0;
    int counterValidari = 0;
private:
    virtual void ValideazaTipBilet(Bilet*) = 0; //metoda virtuala pura pentru a verifica daca tipul de bilet se poate incarca pe card
    virtual void AutoAdaugareBilet() = 0; //metoda virtuala pura pentru a adauga automat un bilet de tipul cardului
    void ConsumaBiletIndex(int);
public:
    Card() = default; //constructorul default este suficient
    Card(const Card&) = delete; //cardurile nu se pot clona
    Card& operator=(const Card&) = delete; //cardurile nu se pot clona
    virtual ~Card();

    void AdaugaBilet(Bilet *bilet);
    float SumaBileteDisponibile() const;
    friend ostream& operator<<(ostream&, const Card&);

    bool ConsumaBiletSuprafata();
    bool ConsumaBiletMetrou();
    bool ConsumaBiletTranzit();
};

Card::~Card() {
    //dezalocam memoria pentru bilete
    for(Bilet *bilet : bilete) {
        delete bilet;
    }
}
void Card::AdaugaBilet(Bilet *bilet) {
    ValideazaTipBilet(bilet);
    bilete.push_back(bilet);
}
float Card::SumaBileteDisponibile() const {
    float suma = 0;
    for(Bilet *bilet : bilete) suma += bilet->GetPret();
    return suma;
}
ostream& operator<<(ostream& out, const Card& c) {
    out << typeid(c).name() << endl;
    out << "Tipul ultimului bilet folosit: " << c.tipUltimulBiletFolosit << endl;
    out << "Timpul ultimei validari: " << c.timpUltimaValidare << endl;
    out << "Suma disponibila: " << c.SumaBileteDisponibile() << endl;
    return out;
}
void Card::ConsumaBiletIndex(int index) {
    bilete.erase(bilete.begin() + index); //stergem biletul
    counterValidari++; //incrementam numarul de validari
    timpUltimaValidare = SystemTime::GetTime();
    if(counterValidari == 8) {
        AutoAdaugareBilet();
        counterValidari = 0;
    }
}
bool Card::ConsumaBiletSuprafata() {
    int i = 0;
    while (i < bilete.size()) {
        if(dynamic_cast<BiletSuprafata*>(bilete[i])) {
            ConsumaBiletIndex(i);
            tipUltimulBiletFolosit = "suprafata";
            return true;
        }
        i++;
    }
    return false;
}
bool Card::ConsumaBiletMetrou() {
    int i = 0;
    while (i < bilete.size()) {
        if(dynamic_cast<BiletMetrou*>(bilete[i])) {
            ConsumaBiletIndex(i);
            tipUltimulBiletFolosit = "metrou";
            return true;
        }
        i++;
    }
    return false;
}
bool Card::ConsumaBiletTranzit() {
    int i = 0;
    while (i < bilete.size()) {
        if(BiletTranzit* bilet = dynamic_cast<BiletTranzit*>(bilete[i])) {
            if(!bilet->EsteExpirat()) {
                ConsumaBiletIndex(i);
                tipUltimulBiletFolosit = "tranzit";
                return true;
            }
        }
        i++;
    }
    return false;
}

class CardSuprafata: public Card {
    void ValideazaTipBilet(Bilet*) override;
    void AutoAdaugareBilet() override;
};

void CardSuprafata::ValideazaTipBilet(Bilet *bilet) {
    //downcasting pentru verificare
    if(!dynamic_cast<BiletSuprafata*>(bilet) && !dynamic_cast<BiletMetrou*>(bilet)) {
        throw TipBiletIlegal();
    }
}
void CardSuprafata::AutoAdaugareBilet() {
    bilete.push_back(new BiletSuprafata());
}

class CardMetrou: public Card {
    void ValideazaTipBilet(Bilet*) override;
    void AutoAdaugareBilet() override;
};

void CardMetrou::ValideazaTipBilet(Bilet *bilet) {
    //downcasting pentru verificare
    if(!dynamic_cast<BiletSuprafata*>(bilet) && !dynamic_cast<BiletMetrou*>(bilet)) {
        throw TipBiletIlegal();
    }
}
void CardMetrou::AutoAdaugareBilet() {
    bilete.push_back(new BiletMetrou());
}

class CardTranzit: public Card {
    void ValideazaTipBilet(Bilet*) override;
    void AutoAdaugareBilet() override;
    friend ostream& operator<<(ostream&, const CardTranzit&); //suprascriem operatorul pentru a afisa timpul biletelor tranzit
};

void CardTranzit::ValideazaTipBilet(Bilet *bilet) {
    //downcasting pentru verificare
    if(!dynamic_cast<BiletTranzit*>(bilet)) {
        throw TipBiletIlegal();
    }
}
void CardTranzit::AutoAdaugareBilet() {
    bilete.push_back(new BiletTranzit());
}
ostream& operator<<(ostream& out, const CardTranzit& c) {
    out << dynamic_cast<const Card&>(c); //upcasting si utilizarea operatorului << definit pe Card
    out << "Timp bilete disponibile: " << endl;
    for(Bilet *bilet : c.bilete) {
        BiletTranzit *biletTranzit = dynamic_cast<BiletTranzit*>(bilet);
        if(biletTranzit->EsteExpirat()) {
            out << "EXPIRAT" << endl;
        }
        else {
            out << SystemTime::GetTime() - biletTranzit->GetTimestampCumparare() << endl; //afisarea timpului ramas
        }
    }
    return out;
}

/* ----------------- APARAT VALIDARE ------------- */
class AparatValidare {
    int numarScanari;
    string locatie; //posibile valori: metrou sau alte vehicule suprafata
public:
    AparatValidare(string locatie); //constructor parametrizat
    AparatValidare(const AparatValidare&) = default; //constructorul de copiere default e suficient
    AparatValidare& operator=(const AparatValidare&) = default; //atribuirea default e suficienta
    ~AparatValidare() = default; //destructorul default e suficient

    friend ostream& operator<<(ostream&, const AparatValidare&);

    bool ValidareCard(Card&);
    bool ValidareCard(CardTranzit&);
};

AparatValidare::AparatValidare(string locatie): numarScanari(0), locatie(locatie) {}
ostream& operator<<(ostream& out, const AparatValidare& av) {
    out << "Numar scanari: " << av.numarScanari << endl;
    out << "Locatia: " << av.locatie << endl;
    return out;
}
bool AparatValidare::ValidareCard(Card& card) {
    //apelata pentru cardurile de suprafata sau metrou
    //cu dynamic cast si bad_cast am putea sa ne asiguram ca nu se foloseste pentru un card de tranzit
    if(locatie == "metrou") {
        return card.ConsumaBiletMetrou();
    }
    else {
        return card.ConsumaBiletSuprafata();
    }
}
bool AparatValidare::ValidareCard(CardTranzit& card) {
    //apelata pentru cardurile de suprafata sau metrou
    return card.ConsumaBiletTranzit();
}

/* ----------------- MAIN ----------------- */
int main() {

    CardSuprafata cardSuprafata;
    cout << "Creare card suprafata success" << endl;
    cardSuprafata.AdaugaBilet(new BiletSuprafata());
    cardSuprafata.AdaugaBilet(new BiletMetrou());
    cout << "Adaugare bilete cu success" << endl;
    try {
        cardSuprafata.AdaugaBilet(new BiletTranzit());
        cout << "Adaugare bilete cu success" << endl; //nu ar trebui sa se afiseze
    }
    catch (TipBiletIlegal& ex) {
        cout << ex.what() << endl;
    }
    cout << cardSuprafata << endl << endl;

    CardMetrou cardMetrou;
    cout << "Creare card metrou success" << endl;
    cardMetrou.AdaugaBilet(new BiletMetrou());
    cardMetrou.AdaugaBilet(new BiletSuprafata());
    cout << "Adaugare bilete cu success" << endl;
    try {
        cardMetrou.AdaugaBilet(new BiletTranzit());
        cout << "Adaugare bilete cu success" << endl; //nu ar trebui sa se afiseze
    }
    catch (TipBiletIlegal& ex) {
        cout << ex.what() << endl;
    }
    cout << cardMetrou << endl << endl;


    CardTranzit cardTranzit;
    cardTranzit.AdaugaBilet(new BiletTranzit());
    cout << "Adaugare bilete cu success" << endl;
    try {
        cardTranzit.AdaugaBilet(new BiletSuprafata());
        cout << "Adaugare bilete cu success" << endl; //nu ar trebui sa se afiseze
    }
    catch (TipBiletIlegal& ex) {
        cout << ex.what() << endl;
    }
    try {
        cardTranzit.AdaugaBilet(new BiletMetrou());
        cout << "Adaugare bilete cu success" << endl; //nu ar trebui sa se afiseze
    }
    catch (TipBiletIlegal& ex) {
        cout << ex.what() << endl;
    }
    SystemTime::IncrementTime(50); //modificarea timpului
    cardTranzit.AdaugaBilet(new BiletTranzit());
    SystemTime::IncrementTime(50); //modificarea timpului; primul bilet este expirat
    cardTranzit.AdaugaBilet(new BiletTranzit());
    SystemTime::IncrementTime(10);
    cout << cardTranzit << endl << endl;

    AparatValidare aparatValidareMetrou("metrou");
    cout << aparatValidareMetrou.ValidareCard(cardSuprafata) << endl; //success
    cout << aparatValidareMetrou.ValidareCard(cardSuprafata) << endl; //esec; nu mai sunt bilete
    cout << aparatValidareMetrou.ValidareCard(cardMetrou) << endl; //success
    cout << aparatValidareMetrou.ValidareCard(cardMetrou) << endl; //esec; nu mai sunt bilete
    cout << cardSuprafata << endl << cardMetrou << endl;

    cout << aparatValidareMetrou.ValidareCard(cardTranzit) << endl; //success
    cout << aparatValidareMetrou.ValidareCard(cardTranzit) << endl; //success
    cout << aparatValidareMetrou.ValidareCard(cardTranzit) << endl; //esec; nu mai sunt bilete ne-expirate
    cout << cardTranzit << endl; //observam ca biletul expirat nu a fost folosit

    //mai adaugam 6 bilete pe cardul de tranzit si le validam; pentru a se auto adauga un bilet tranzit
    for(int i=0;i<6;i++) {
        cardTranzit.AdaugaBilet(new BiletTranzit());
        aparatValidareMetrou.ValidareCard(cardTranzit);
    }
    cout << cardTranzit; // se afiseaza biletul expirat si 0 = timpul ramas pentru biletul de tranzit auto adaugat

    return 1;
}