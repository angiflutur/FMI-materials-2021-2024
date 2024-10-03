package Models;

import java.util.Date;

public class Imprumut {
    private String id;
    private Cititor client;
    private Carte carte;
    private Date dataImprumut;
    private Date dataRetur;

    // constructor

    public Imprumut(String id, Cititor client, Carte carte, Date dataImprumut, Date dataRetur) {
        this.id = id;
        this.client = client;
        this.carte = carte;
        this.dataImprumut = dataImprumut;
        this.dataRetur = dataRetur;
    }

    // setter getter

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Cititor getClient() {
        return client;
    }

    public void setClient(Cititor client) {
        this.client = client;
    }

    public Carte getCarte() {
        return carte;
    }

    public void setCarte(Carte carte) {
        this.carte = carte;
    }

    public Date getDataImprumut() {
        return dataImprumut;
    }

    public void setDataImprumut(Date dataImprumut) {
        this.dataImprumut = dataImprumut;
    }

    public Date getDataRetur() {
        return dataRetur;
    }

    public void setDataRetur(Date dataRetur) {
        this.dataRetur = dataRetur;
    }

    @Override
    public String toString() {
        return "Imprumut{" +
                "id='" + id + '\'' +
                ", client=" + client +
                ", carte=" + carte +
                ", dataImprumut=" + dataImprumut +
                ", dataRetur=" + dataRetur +
                '}';
    }
}
