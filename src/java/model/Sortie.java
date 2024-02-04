package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "sortie")
public class Sortie extends JDBC {
    @Id(name = "id", sequence = "sortie_id_seq")
    private int id;

    @Column(name = "idmateriel")
    private int idmateriel;

    @Column(name = "qte")
    private double qte;

    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getIdmateriel() {
        return this.idmateriel;
    }
    public void setIdmateriel(int idmateriel) {
        this.idmateriel = idmateriel;
    }
    public double getQte() {
        return this.qte;
    }
    public void setQte(double qte) {
        this.qte = qte;
    }
}
