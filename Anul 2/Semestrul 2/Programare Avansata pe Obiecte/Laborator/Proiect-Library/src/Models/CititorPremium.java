package Models;

import java.util.Arrays;

public class CititorPremium extends Cititor {
    private final static int limitaCarti = 100;

    public CititorPremium(String id, String nume, String prenume, String nrTelefon, String email, String CNP) {
        super(id, nume, prenume, nrTelefon, email, CNP);
        this.cartiImprumutate = new Carte[limitaCarti];
    }

    public int getLimitaCarti() {
        return limitaCarti;
    }

    public int pretPermis() {
        return 50;
    }

    @Override
    public String toString() {
        return "CititorPremium{" +
                super.toString() +
                ", cartiImprumutate=" + Arrays.toString(cartiImprumutate) +
                ", nrCarti=" + nrCarti +
                '}';
    }
}
