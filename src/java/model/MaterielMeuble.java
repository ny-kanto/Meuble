package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "materiel_meuble")
public class MaterielMeuble extends JDBC {
    @Id(name = "id", sequence = "materiel_meuble_id_seq")
    private int id;

    @Column(name = "idmeuble")
    private int idmeuble;

    @Column(name = "idmateriel")
    private int idmateriel;

    @Column(name = "idvolume")
    private int idvolume;

    @Column(name = "qte")
    private double qte;

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
    public int getIdmateriel() {
        return this.idmateriel;
    }
    public void setIdmateriel(int idmateriel) {
        this.idmateriel = idmateriel;
    }
    public int getIdvolume() {
        return this.idvolume;
    }
    public void setIdvolume(int idvolume) {
        this.idvolume = idvolume;
    }
    public double getQte() {
        return this.qte;
    }
    public void setQte(double qte) {
        this.qte = qte;
    }
}
