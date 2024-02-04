package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Table(name = "experience")
public class Experience extends JDBC {
    @Id(name = "id", sequence = "experience_id_seq")
    private int id;

    @Column(name = "nom")
    private String nom;

    @Column(name = "anneemin")
    private int anneemin;

    @Column(name = "anneemax")
    private int anneemax;

    @Column(name = "salairemulti")
    private double salairemulti;

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

    public int getAnneemin() {
        return this.anneemin;
    }

    public void setAnneemin(int anneemin) {
        this.anneemin = anneemin;
    }

    public int getAnneemax() {
        return this.anneemax;
    }

    public void setAnneemax(int anneemax) {
        this.anneemax = anneemax;
    }

    public double getSalairemulti() {
        return salairemulti;
    }

    public void setSalairemulti(double salairemulti) {
        this.salairemulti = salairemulti;
    }

    public void updateExperience(int id, String nom, int anneemin, int anneemax, double salairemulti, Connection c) {
        String sql = "UPDATE experience SET nom = ?, anneemin = ?, anneemax = ?, salairemulti = ? WHERE id = ?";

        try {
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, nom);
            ps.setInt(2, anneemin);
            ps.setInt(3, anneemax);
            ps.setDouble(4, salairemulti);
            ps.setInt(5, id);
            ps.execute();

            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
