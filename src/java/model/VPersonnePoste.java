package model;

import java.sql.Date;

import genericdao.Column;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "v_materiel_meuble")
public class VPersonnePoste extends JDBC {
    @Column(name = "idpersonne")
    private int idpersonne;

    @Column(name = "nompersonne")
    private String nompersonne;

    @Column(name = "idposte")
    private int idposte;

    @Column(name = "nomposte")
    private String nomposte;

    @Column(name = "salaire")
    private double salaire;

    @Column(name = "dateembauche")
    private Date dateembauche;

    public int getIdpersonne() {
        return this.idpersonne;
    }
    public void setIdpersonne(int idpersonne) {
        this.idpersonne = idpersonne;
    }
    public String getNompersonne() {
        return this.nompersonne;
    }
    public void setNompersonne(String nompersonne) {
        this.nompersonne = nompersonne;
    }
    public int getIdposte() {
        return this.idposte;
    }
    public void setIdposte(int idposte) {
        this.idposte = idposte;
    }
    public String getNomposte() {
        return this.nomposte;
    }
    public void setNomposte(String nomposte) {
        this.nomposte = nomposte;
    }
    public double getSalaire() {
        return this.salaire;
    }
    public void setSalaire(double salaire) {
        this.salaire = salaire;
    }
    public Date getDateembauche() {
        return this.dateembauche;
    }
    public void setDateembauche(Date dateembauche) {
        this.dateembauche = dateembauche;
    }
}
