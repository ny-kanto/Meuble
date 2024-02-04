package model;

import genericdao.Column;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "v_etat_stock")
public class VEtatStock extends JDBC{

    @Column(name = "idmateriel")
    private int idmateriel;

    @Column(name = "nommateriel")
    private String nommateriel;

    @Column(name = "sommeentree")
    private double sommeentree;

    @Column(name = "sommesortie")
    private double sommesortie;

    @Column(name = "reste")
    private double reste;

    public int getIdmateriel() {
        return idmateriel;
    }
    public void setIdmateriel(int idmateriel) {
        this.idmateriel = idmateriel;
    }
    public String getNommateriel() {
        return this.nommateriel;
    }
    public void setNommateriel(String nommateriel) {
        this.nommateriel = nommateriel;
    }
    public double getSommeentree() {
        return this.sommeentree;
    }
    public void setSommeentree(double sommeentree) {
        this.sommeentree = sommeentree;
    }
    public double getSommesortie() {
        return this.sommesortie;
    }
    public void setSommesortie(double sommesortie) {
        this.sommesortie = sommesortie;
    }
    public double getReste() {
        return this.reste;
    }
    public void setReste(double reste) {
        this.reste = reste;
    }
}
