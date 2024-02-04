package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import genericdao.Column;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "v_personne_experience")
public class VPersonneExperience extends JDBC {
    @Column(name = "idpersonne")
    private int idpersonne;

    @Column(name = "nompersonne")
    private String nompersonne;

    @Column(name = "dateembauche")
    private Date dateembauche;

    @Column(name = "idposte")
    private int idposte;

    @Column(name = "nomposte")
    private String nomposte;

    @Column(name = "salaireexp")
    private double salaireexp;

    @Column(name = "idexperience")
    private int idexperience;

    @Column(name = "nomexperience")
    private String nomexperience;

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
    public Date getDateembauche() {
        return this.dateembauche;
    }
    public void setDateembauche(Date dateembauche) {
        this.dateembauche = dateembauche;
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
    public double getSalaireexp() {
        return this.salaireexp;
    }
    public void setSalaireexp(double salaireexp) {
        this.salaireexp = salaireexp;
    }
    public int getIdexperience() {
        return this.idexperience;
    }
    public void setIdexperience(int idexperience) {
        this.idexperience = idexperience;
    }
    public String getNomexperience() {
        return this.nomexperience;
    }
    public void setNomexperience(String nomexperience) {
        this.nomexperience = nomexperience;
    }
    public List<VPersonneExperience> getPersonneExperiences(double salaire_min, double salaire_max, Connection c) {
        List<VPersonneExperience> listep = new ArrayList<>();
        String sql = "select * from v_personne_experience where salaireexp >= ? AND salaireexp <= ?";

        try {
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setDouble(1, salaire_min);
            ps.setDouble(2, salaire_max);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                VPersonneExperience p = new VPersonneExperience();
                p.setIdpersonne(rs.getInt("idpersonne"));
                p.setNompersonne(rs.getString("nompersonne"));
                p.setIdposte(rs.getInt("idposte"));
                p.setNomposte(rs.getString("nomposte"));
                p.setIdexperience(rs.getInt("idexperience"));
                p.setNomexperience(rs.getString("nomexperience"));
                p.setSalaireexp(rs.getDouble("salaireexp"));
                listep.add(p);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listep;
    }
}
