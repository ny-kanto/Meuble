package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "meuble_vente")
public class MeubleVente extends JDBC {
    @Id(name = "id", sequence = "meuble_vente_id_seq")
    private int id;

    @Column(name = "idmeuble")
    private int idmeuble;

    @Column(name = "idvolume")
    private int idvolume;

    @Column(name = "prixvente")
    private double prixvente;

    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getIdmeuble() {
        return this.idmeuble;
    }
    public void setIdmeuble(int idmeuble) {
        this.idmeuble = idmeuble;
    }
    public int getIdvolume() {
        return this.idvolume;
    }
    public void setIdvolume(int idvolume) {
        this.idvolume = idvolume;
    }
    public double getPrixvente() {
        return this.prixvente;
    }
    public void setPrixvente(double prixvente) {
        this.prixvente = prixvente;
    }
}
