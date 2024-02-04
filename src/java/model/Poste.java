package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "poste")
public class Poste extends JDBC {
    @Id(name = "id", sequence = "poste_id_seq")
    private int id;

    @Column(name = "nom")
    private String nom;

    @Column(name = "salaire")
    private double salaire;

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
    public double getSalaire() {
        return this.salaire;
    }
    public void setSalaire(double salaire) {
        this.salaire = salaire;
    }
}
