package Services;

import Models.*;

import java.util.Arrays;
import java.util.Comparator;

public class ServiciiCititor {
    private int contor = 0;
    public Cititor[] cititori;
    public Imprumut[] istoricImprumut;
    // constructor
    public ServiciiCititor()
    {
        cititori = new Cititor[100];
        istoricImprumut = new Imprumut[100];
    }
    // metoda pentru a verifica daca un cititor este deja inregistrat in biblioteca
    public int existaCititorul(String id)
    {
        for(int i = 0; i < contor; i++)
            if(cititori[i].getId().equals(id))
                return i;
        return -1;
    }

    public void adaugareCititor(Cititor cititor)
    {
        if(existaCititorul(cititor.getId()) > -1)
            System.out.println("Acest cititor exista deja!");
        else{
            if(contor + 1 < 100) {
                System.out.println("Cititor adaugat cu succes!");
                cititori[contor++] = cititor;
            }
            else
                System.out.println("Prea multi cititori");
        }
    }
    public void afisareTotiCititorii()
    {
        if(contor == 0)
            System.out.println("Nu exista niciun cititor!");
        else {
            for(int i = 0; i < contor; i++)
                System.out.println(cititori[i].getNume() + " " + cititori[i].getPrenume());
        }
    }

    public void sortareCititori()
    {
        // folosim o clasa anonima pentru a compara 2 obiecte Cititor
        // dupa nume
        Comparator<Cititor> comparare = new Comparator<Cititor>(){
            public int compare(Cititor c1, Cititor c2){
                if(c1 == null || c2 == null)
                    return 0;
                return c1.getNume().compareTo(c2.getNume());
            }
        };
        // sortam vectorul "cititori"
        Arrays.sort(cititori, comparare);

        for(int i = 0; i < contor; i++)
            System.out.println(cititori[i].getNume() + " " + cititori[i].getPrenume());
    }


}