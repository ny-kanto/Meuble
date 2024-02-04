package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "materiel")
public class Materiel extends JDBC {
    @Id(name = "id", sequence = "materiel_id_seq")
    private int id;

    @Column(name = "nom")
    private String nom;
    
    @Column(name = "prix")
    private double prix;

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

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }
    
}
