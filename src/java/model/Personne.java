package model;

import java.sql.Date;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "personne")
public class Personne extends JDBC {
    @Id(name = "id", sequence = "personne_id_seq")
    private int id;

    @Column(name = "nom")
    private String nom;

    @Column(name = "idposte")
    private int idposte;

    @Column(name = "dateembauche")
    private Date dateembauche;

    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return this.nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public int getIdposte() {
        return this.idposte;
    }
    public void setIdposte(int idposte) {
        this.idposte = idposte;
    }
    public Date getDateembauche() {
        return this.dateembauche;
    }
    public void setDateembauche(Date dateembauche) {
        this.dateembauche = dateembauche;
    }
}
