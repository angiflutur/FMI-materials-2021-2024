package Models;

public class Autor {
    private final String id;
    private String nume;
    private String prenume;
    private String nationalitate;

    // constructor
    public Autor(String id, String nume, String prenume, String nationalitate) {
        this.id = id;
        this.nume = nume;
        this.prenume = prenume;
        this.nationalitate = nationalitate;
    }

    // setteri si getteri pentru atribute

    public String getId() {
        return id;
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

    public String getNationalitate() {
        return nationalitate;
    }

    public void setNationalitate(String nationalitate) {
        this.nationalitate = nationalitate;
    }

    @Override
    public String toString() {
        return "Autor{" +
                "id='" + id + '\'' +
                ", nume='" + nume + '\'' +
                ", prenume='" + prenume + '\'' +
                ", nationalitate='" + nationalitate + '\'' +
                '}';
    }
}
