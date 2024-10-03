package Models;

public class Editura {
    private final String id;
    private String nume;

    // constructor

    public Editura(String id, String nume) {
        this.id = id;
        this.nume = nume;
    }

    // setteri getteri

    public String getId() {
        return id;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }


    @Override
    public String toString() {
        return "Editura{" +
                "id='" + id + '\'' +
                ", nume='" + nume + '\'' +
                '}';
    }
}
