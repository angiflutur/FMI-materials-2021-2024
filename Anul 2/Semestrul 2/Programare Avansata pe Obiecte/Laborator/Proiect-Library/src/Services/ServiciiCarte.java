package Services;

import Models.Autor;
import Models.Carte;
import Models.Editura;
import Models.Sectiune;

public class ServiciiCarte {
    public Carte[] carti;
    public Sectiune[] sectiuni;
    public int indexMaxim;
    public int indexSectiune;
    public int indexCurent;

    public ServiciiCarte(int indexMaxim) {
        this.indexMaxim = indexMaxim;
        this.carti = new Carte[indexMaxim];
        this.sectiuni = new Sectiune[10];
        this.indexSectiune = -1;
        this.indexCurent = -1;
    }
    // adaugare carte
    public void adaugaCarte(Carte carte, Sectiune sectiune) {
        boolean existaCartea = false;
        // verificam daca cartea exista deja in biblioteca
        for (Carte c: carti) {
            if (c == null) {
                break;
            }
            if (c.getTitlu().equals(carte.getTitlu())) {
                existaCartea = true;
                break;
            }
        }

        if (existaCartea == true) {
            System.out.println("Cartea este deja in biblioteca!");
            return;
        }

        boolean existaSectiunea = false;
        // verificam daca exista sectiunea
        for (Sectiune i: sectiuni) {
            if (i == null) {
                break;
            }
            if (i.getNume().equals(sectiune.getNume())) {
                existaSectiunea = true;
                carte.setSectiune(sectiune);
                break;
            }
        }
        // adaugam cartea daca sectiunea exista
        if (existaSectiunea)
            for (int i = 0; i < carti.length; i++) {
                if (carti[i] == null) {
                    carti[i] = carte;
                    indexCurent++;
                    System.out.println("Carte adaugata cu succes!");
                    break;
                }
            }
        else
            System.out.println("Sectiunea nu exista!");
    }
    // stergere carte
    public void stergeCarte(Carte carte) {
        boolean found = false;
        // cautam cartea in biblioteca, daca exista o stergem
        for (int i = 0; i <= indexCurent; i++) {
            if (carti[i].getId().equals(carte.getId())) {
                found = true;
                carti[i] = null;
                for (int j = i; j < indexCurent; j++) {
                    carti[j] = carti[j + 1];
                }
                carti[indexCurent] = null;
                indexCurent--;
                System.out.println("Cartea a fost stearsa cu succes!");
                break;
            }
        }
        if (!found) {
            System.out.println("Cartea nu a fost gasita in biblioteca!");
        }
    }
    //adaugare sectiune
    public void adaugaSectiune(Sectiune sectiune) {
        boolean exists = false;
        // verificam daca sectiunea exista deja
        for (Sectiune section: sectiuni) {
            if (section != null && section.getNume().equals(sectiune.getNume())) {
                exists = true;
                break;
            }
        }
        if (exists) {
            System.out.println("Aceasta sectiune este deja in biblioteca!");
        } else {
            System.out.println("Sectiune adaugata cu succes!");
            indexSectiune++;
            sectiuni[indexSectiune] = new Sectiune(sectiune.getId(), sectiune.getNume());
        }
    }

    //stergere sectiune
    public void stergeSectiune(Sectiune sectiune) {
        boolean found = false;
        // verificam daca sectiunea exista
        for (int i = 0; i <= indexSectiune; i++) {
            if (sectiuni[i].getNume().equals(sectiune.getNume())) {
                found = true;
                for (int j = i; j < indexSectiune; j++) {
                    sectiuni[j] = sectiuni[j + 1];
                }
                sectiuni[indexSectiune--] = null;
                System.out.println("Sectiune stearsa cu succes!");
                for (Carte carte: carti) {
                    if (carte != null && carte.getSectiune().equals(sectiune)) {
                        stergeCarte(carte); // apelam metoda stergeCarte pentru a sterge cartea
                    }
                    break;
                }
            }

        }
        // daca sectiunea nu exista, nu o putem sterge
        if (!found) {
            System.out.println("Sectiunea nu a fost gasita in biblioteca!");
        }
    }
    //update informatii carte
    public void updateCarte(String idCarte, String titlu, Autor autor, int anPublicare,Editura editura, Sectiune sectiune) {
        for (Carte carte : carti) {
            if (carte != null && carte.getId() == idCarte) {
                carte.setTitlu(titlu);
                carte.setAutor(autor);
                carte.setEditura(editura);
                carte.setAnPublicare(anPublicare);
                for (Sectiune sec : sectiuni) {
                    if (sec != null && sec.getNume().equals(sectiune.getNume())) {
                        carte.setSectiune(sectiune);
                        break;
                    }
                }
                System.out.println("Detaliile despre cartea cu id-ul " + idCarte + " au fost modificate cu succes!");
                return;
            }
        }
        // daca nu am dat return mai devreme, inseamna ca nu am gasit cartea in biblioteca
        System.out.println("Cartea cu id-ul " +idCarte + " nu a fost gasita!");
    }
    public void detaliiCarte(Carte carte) {
        System.out.println("Detalii despre cartea cu titlul \"" + carte.getTitlu() + "\":");
        System.out.println("Autor: " + carte.getAutor().getNume() + " " + carte.getAutor().getPrenume());
        System.out.println("Editura: " + carte.getEditura().getNume());
        System.out.println("An aparitie: " + carte.getAnPublicare());
        System.out.println("Sectiune: " + carte.getSectiune().getNume());
    }

    public void afisareToateCartile() {
        for (Carte carte : carti) {
            if (carte != null) {
                System.out.println(carte.getTitlu() + " de " + carte.getAutor().getNume() + " " + carte.getAutor().getPrenume());
            }
        }
    }

    public void afisareCartiAutor(Autor autor) {
        int ok = 0;

        for (Carte carte : carti) {

            if (carte != null && carte.getAutor().getNume().equals(autor.getNume())) {
                if(ok == 0)
                    System.out.println("Cartile de la autorul " + autor.getNume() + " " + autor.getPrenume() + " sunt:\n");
                ok = 1;
                System.out.println(carte.getTitlu());
            }
        }
        if(ok == 0)
            System.out.println("Biblioteca nu are carti scrise de autorul " + autor.getNume());
    }

    public void afisareCartiSectiune(Sectiune sectiune)
    {
        int ok = 0;

        for (Carte carte : carti) {

            if (carte != null && carte.getSectiune().getNume().equals(sectiune.getNume())) {
                if(ok == 0)
                    System.out.println("Cartile din sectiunea " + sectiune.getNume() + " sunt:\n");
                ok = 1;
                System.out.println(carte.getTitlu());
            }
        }
        if(ok == 0)
            System.out.println("Biblioteca nu are carti in sectiunea " + sectiune.getNume());

    }
}