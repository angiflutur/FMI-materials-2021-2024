package Models;

public class Carte {
    private final String id;
    private String titlu;
    private int anPublicare;
    private Autor autor;
    private Editura editura;
    private Sectiune sectiune;
    private int numarCopii;

    // constructor


    public Carte(String id, String titlu, int anPublicare, Autor autor, Editura editura, Sectiune sectiune, int numarCopii) {
        this.id = id;
        this.titlu = titlu;
        this.anPublicare = anPublicare;
        this.autor = autor;
        this.editura = editura;
        this.sectiune = sectiune;
        this.numarCopii = numarCopii;
    }

    // setteri si getteri pentru atribute

    public String getId() {
        return id;
    }

    public String getTitlu() {
        return titlu;
    }

    public void setTitlu(String titlu) {
        this.titlu = titlu;
    }

    public int getAnPublicare() {
        return anPublicare;
    }

    public void setAnPublicare(int anPublicare) {
        this.anPublicare = anPublicare;
    }

    public Autor getAutor() {
        return autor;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }

    public Editura getEditura() {
        return editura;
    }

    public void setEditura(Editura editura) {
        this.editura = editura;
    }

    public Sectiune getSectiune() {
        return sectiune;
    }

    public void setSectiune(Sectiune sectiune) {
        this.sectiune = sectiune;
    }

    public int getNumarCopii() {
        return numarCopii;
    }

    public void setNumarCopii(int numarCopii) {
        this.numarCopii = numarCopii;
    }

    @Override
    public String toString() {
        return "Carte{" +
                "id='" + id + '\'' +
                ", titlu='" + titlu + '\'' +
                ", anPublicare=" + anPublicare +
                ", autor=" + autor +
                ", editura=" + editura +
                ", sectiune=" + sectiune +
                ", numarCopii=" + numarCopii +
                '}';
    }
}
