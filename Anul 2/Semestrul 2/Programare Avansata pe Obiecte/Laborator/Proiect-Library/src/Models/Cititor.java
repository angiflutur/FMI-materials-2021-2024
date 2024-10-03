package Models;
import java.util.Arrays;

public abstract class Cititor {
    protected String id;
    protected String nume;
    protected String prenume;
    protected String nrTelefon;
    protected String email;
    protected String cnp;
    Carte[] cartiImprumutate;
    public int nrCarti = 0;

    public Cititor(String id, String nume, String prenume, String nrTelefon, String email, String cnp) {
        this.id = id;
        this.nume = nume;
        this.prenume = prenume;
        this.nrTelefon = nrTelefon;
        this.email = email;
        this.cnp = cnp;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getPrenume() {
        return prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public String getNrTelefon() {
        return nrTelefon;
    }

    public void setNrTelefon(String nrTelefon) {
        this.nrTelefon = nrTelefon;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCnp() {
        return cnp;
    }

    public void setCnp(String cnp) {
        this.cnp = cnp;
    }

    public Carte[] getCartiImprumutate() {
        return cartiImprumutate;
    }

    public void setCartiImprumutate(Carte[] cartiImprumutate) {
        this.cartiImprumutate = cartiImprumutate;
    }

    public int getNrCarti() {
        return nrCarti;
    }

    public void setNrCarti(int nrCarti) {
        this.nrCarti = nrCarti;
    }

    @Override
    public String toString() {
        return "Cititor{" +
                "id='" + id + '\'' +
                ", nume='" + nume + '\'' +
                ", prenume='" + prenume + '\'' +
                ", nrTelefon='" + nrTelefon + '\'' +
                ", email='" + email + '\'' +
                ", cnp='" + cnp + '\'' +
                ", cartiImprumutate=" + Arrays.toString(cartiImprumutate) +
                ", nrCarti=" + nrCarti +
                '}';
    }
}