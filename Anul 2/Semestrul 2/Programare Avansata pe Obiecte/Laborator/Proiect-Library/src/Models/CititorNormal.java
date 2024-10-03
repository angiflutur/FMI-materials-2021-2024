package Models;

import java.util.Arrays;

public class CititorNormal extends Cititor {

    private static int count = 0;
    private final static int limitaCarti = 3;


    public CititorNormal(String id, String nume, String prenume, String nrTelefon, String email, String CNP) {
        super(id, nume, prenume, nrTelefon, email, CNP);
        this.cartiImprumutate = new Carte[limitaCarti];
    }

    public static int getCount() {
        return count;
    }

    public static void setCount(int count) {
        CititorNormal.count = count;
    }

    public int getLimitaCarti()
    {
        return limitaCarti;
    }

    public int pretPermis()
    {
        return 20;
    }

    @Override
    public String toString() {
        return "CititorNormal{" +
                super.toString() +
                "cartiImprumutate=" + Arrays.toString(cartiImprumutate) +
                '}';
    }

}
