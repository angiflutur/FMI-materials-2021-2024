package Services;

import Models.*;

import java.util.Scanner;


public class Main {
    public static void main(String[] args) {
        ServiciiCarte serviciiCarte = new ServiciiCarte(100);
        ServiciiCititor serviciiCititor = new ServiciiCititor();
        Sectiune sectiune1 = new Sectiune("sectiune1", "Literatura clasica");
        Sectiune sectiune2 = new Sectiune("sectiune2", "Literatura contemporana");
        Sectiune sectiune3 = new Sectiune("sectiune3", "Literatura fictiune");

        Autor autor1 = new Autor("autor1", "Marquez", "Gabriel", "columbian");
        Autor autor2 = new Autor("autor2", "Murakami", "Haruki", "japonez");
        Autor autor3 = new Autor("autor3","Tolstoi", "Lev", "rus");
        Autor autor4 = new Autor("autor4", "Preda","Marin","roman");
        Autor autor5 = new Autor("autor5", "Eliade", "Mircea", "roman");
        Autor autor6 = new Autor("autor6", "Creanga","Ion", "roman");

        Editura editura1 = new Editura("editura1", "Nemira");
        Editura editura2 = new Editura("editura2", "Humanitas");
        Editura editura3 = new Editura("editura3", "Polirom");
        Editura editura4 = new Editura("editura4", "Trei");

        Carte carte1 = new Carte("carte1", "Un veac de singuratate", 1967, autor1, editura1, sectiune1, 5);
        Carte carte2 = new Carte("carte2", "Dragostea in timpul holerei", 1985, autor1, editura1, sectiune2, 2);
        Carte carte3 = new Carte("carte3", "Generalul in labirintul sau", 1989, autor1, editura1, sectiune3, 3);
        Carte carte4 = new Carte("carte4", "Norwegian Wood", 1987, autor2, editura2, sectiune2, 3);
        Carte carte5 = new Carte("carte5", "Kafka pe malul marii", 2002, autor2, editura2, sectiune3, 4);
        Carte carte6 = new Carte("carte6", "Razboi si pace", 1869, autor3, editura1, sectiune1, 7);
        Carte carte7 = new Carte("carte7", "Anna Karenina", 1877, autor3, editura1, sectiune1, 1);
        Carte carte8 = new Carte("carte8", "Invierea", 1899, autor3, editura2, sectiune3, 3);
        Carte carte9 = new Carte("carte9", "Morometii", 1955, autor4, editura3, sectiune1, 6);
        Carte carte10 = new Carte("carte10", "Cel mai iubit dintre pamanteni", 1980, autor4, editura3, sectiune2, 4);
        Carte carte11 = new Carte("carte11", "Delirul", 1975, autor4, editura3, sectiune3, 2);
        Carte carte12 = new Carte("carte12", "Maitreyi", 1933, autor5, editura4, sectiune1, 4);
        Carte carte13 = new Carte("carte13", "Noaptea de Sanziene", 1968, autor5, editura4, sectiune3, 2);
        Carte carte14 = new Carte("carte14", "Amintiri din copilarie", 1881, autor6, editura4, sectiune1, 10);
        Carte carte15 = new Carte("carte15", "Capra cu trei iezi", 1885, autor6, editura3, sectiune3, 8);

        serviciiCarte.adaugaSectiune(sectiune1);
        serviciiCarte.adaugaSectiune(sectiune2);
        serviciiCarte.adaugaSectiune(sectiune3);

        serviciiCarte.adaugaCarte(carte1, carte1.getSectiune());
        serviciiCarte.adaugaCarte(carte2, carte2.getSectiune());
        serviciiCarte.adaugaCarte(carte3, carte3.getSectiune());
        serviciiCarte.adaugaCarte(carte4, carte4.getSectiune());
        serviciiCarte.adaugaCarte(carte5, carte5.getSectiune());
        serviciiCarte.adaugaCarte(carte6, carte6.getSectiune());
        serviciiCarte.adaugaCarte(carte7, carte7.getSectiune());
        serviciiCarte.adaugaCarte(carte8, carte8.getSectiune());
        serviciiCarte.adaugaCarte(carte9, carte9.getSectiune());
        serviciiCarte.adaugaCarte(carte10, carte10.getSectiune());
        serviciiCarte.adaugaCarte(carte11, carte11.getSectiune());
        serviciiCarte.adaugaCarte(carte12, carte12.getSectiune());
        serviciiCarte.adaugaCarte(carte13, carte13.getSectiune());
        serviciiCarte.adaugaCarte(carte14, carte14.getSectiune());
        serviciiCarte.adaugaCarte(carte15, carte15.getSectiune());

        CititorNormal cititor1 = new CititorNormal("cititor1", "Popescu", "Maria", "1234567", "cititor1@gmail.com", "CNP01234");
        CititorNormal cititor2 = new CititorNormal("cititor2", "Danila", "Mihai", "595656", "cititor2@gmail.com", "CNP6464");
        CititorPremium cititor3 = new CititorPremium("cititor3", "Atanasiu", "Corina", "1234567", "cititor3@gmail.com", "CNP946");
        CititorPremium cititor4 = new CititorPremium("cititor4", "Grecu", "Andrei", "1234567", "cititor4@gmail.com", "CNP665484");
        serviciiCititor.adaugareCititor(cititor1);
        serviciiCititor.adaugareCititor(cititor2);
        serviciiCititor.adaugareCititor(cititor3);
        serviciiCititor.adaugareCititor(cititor4);

        {
            System.out.println("-----------------------------------");
            System.out.println("Alege o optiune.");
            System.out.println("1: Adauga o carte");
            System.out.println("2: Sterge o carte");
            System.out.println("3: Adauga o sectiune");
            System.out.println("4: Sterge o sectiune si cartile din acea sectiune");
            System.out.println("5: Modifica informatiile unei carti");
            System.out.println("6: Afiseaza detaliile unei carti");
            System.out.println("7: Afisare toate cartile din biblioteca");
            System.out.println("8: Afisare cartile unui autor");
            System.out.println("9: Afisare cartile dintr-o sectiune");
            System.out.println("10: Adauga cititor");
            System.out.println("11: Afisare toti cititorii");
            System.out.println("12: Sortare toti cititorii");
            System.out.println("13: Afisare meniu");
            System.out.println("0: Exit");
            System.out.println("-----------------------------------");

            Scanner reader = new Scanner(System.in);
            int option = reader.nextInt();

            while (option != 0)
            {
                switch(option)
                {
                    case 0:
                    {
                        System.out.println("Iesire din program.");
                        break;
                    }
                    case 1:
                    {
                        Sectiune sectiuneOp1 = new Sectiune("sectiune1", "Literatura clasica");
                        Autor autorOp1 = new Autor("op1", "Creanga","Ion", "roman");
                        Editura edituraOp1 = new Editura("op1", "Trei");

                        Carte carteOp1 = new Carte("op1", "Titlu op1",1888, autorOp1, edituraOp1, sectiuneOp1, 5);
                        serviciiCarte.adaugaCarte(carteOp1, sectiuneOp1);
                        System.out.println("-----------------------------------");
                        break;
                    }
                case 2:
                {
                    serviciiCarte.stergeCarte(carte15);
                    System.out.println("-----------------------------------");
                    break;
                }
                case 3:
                {
                    Sectiune sectiuneOp3 = new Sectiune("op3", "Literatura fantastica");
                    serviciiCarte.adaugaSectiune(sectiuneOp3);
                    System.out.println("-----------------------------------");
                    break;
                }
                case 4:
                {
                    serviciiCarte.stergeSectiune(sectiune3);
                    System.out.println("-----------------------------------");
                    break;
                }
                case 5:
                {
                    serviciiCarte.updateCarte("carte10", "update", autor5, 2023, editura1, sectiune1);
                    System.out.println("-----------------------------------");
                    break;
                }
                case 6:
                {
                    serviciiCarte.detaliiCarte(carte10);
                    System.out.println("-----------------------------------");
                    break;
                }
                case 7:
                {
                    serviciiCarte.afisareToateCartile();
                    System.out.println("-----------------------------------");
                    break;
                }
                case 8:
                {
                    serviciiCarte.afisareCartiAutor(autor6);
                    System.out.println("-----------------------------------");
                    break;
                }
                case 9:
                {
                    serviciiCarte.afisareCartiSectiune(sectiune1);
                    System.out.println("-----------------------------------");
                    break;
                }
                case 10:
                {
                    CititorNormal cititorOp10 = new CititorNormal("op10", "nume", "prenume", "nr telefon", "email", "CNP");
                    serviciiCititor.adaugareCititor(cititorOp10);
                    System.out.println("-----------------------------------");
                    break;
                }
                case 11:
                {
                    serviciiCititor.afisareTotiCititorii();
                    System.out.println("-----------------------------------");
                    break;
                }
                case 12:
                {
                    serviciiCititor.sortareCititori();
                    System.out.println("-----------------------------------");
                    break;
                }
                case 13:
                {
                    System.out.println("-----------------------------------");
                    System.out.println("Alege o optiune.");
                    System.out.println("1: Adauga o carte");
                    System.out.println("2: Sterge o carte");
                    System.out.println("3: Adauga o sectiune");
                    System.out.println("4: Sterge o sectiune si cartile din acea sectiune");
                    System.out.println("5: Modifica informatiile unei carti");
                    System.out.println("6: Afiseaza detaliile unei carti");
                    System.out.println("7: Afisare toate cartile din biblioteca");
                    System.out.println("8: Afisare cartile unui autor");
                    System.out.println("9: Afisare cartile dintr-o sectiune");
                    System.out.println("10: Adauga cititor");
                    System.out.println("11: Afisare toti cititorii");
                    System.out.println("12: Sortare toti cititorii");
                    System.out.println("13: Afisare meniu");
                    System.out.println("0: Exit");
                    System.out.println("-----------------------------------");
                    break;
                }
                    default:
                    {
                        System.out.println("Optiune invalida. Incercati din nou.");
                        break;
                    }
                }

                option = reader.nextInt();
            }
            reader.close();
        }

}

}
