package Models;

public class Sectiune {
    private final String id;
    private String nume;
    private static int contor = 0;

    // constructor
    public Sectiune(String id, String nume) {
        this.id = id;
        this.nume = nume;
    }


    // setter getter

    public String getId() {
        return id;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public static int getContor() {
        return contor;
    }

    public static void setContor(int contor) {
        Sectiune.contor = contor;
    }

    @Override
    public String toString() {
        return "Sectiune{" +
                "id='" + id + '\'' +
                ", nume='" + nume + '\'' +
                '}';
    }
}
