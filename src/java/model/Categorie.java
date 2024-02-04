package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "categorie")
public class Categorie extends JDBC {
    @Id(name = "id", sequence = "categorie_id_seq")
    private int id;

    @Column(name = "nom")
    private String nom;

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
}
