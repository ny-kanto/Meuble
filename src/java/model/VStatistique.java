package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import genericdao.Column;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "v_statistique")
public class VStatistique extends JDBC {

    public VStatistique() {
    }
    
    @Column(name = "idmeuble")
    private int idmeuble;

    @Column(name = "nommeuble")
    private String nommeuble;

    @Column(name = "idvolume")
    private int idvolume;

    @Column(name = "nomvolume")
    private String nomvolume;

    @Column(name = "datevente")
    private int datevente;

    @Column(name = "annee")
    private int annee;

    @Column(name = "quantite_homme")
    private double quantiteHomme;

    @Column(name = "quantite_femme")
    private double quantiteFemme;

    public VStatistique(int idmeuble, String nommeuble, int idvolume, String nomvolume, int datevente, int annee,
            double quantiteHomme, double quantiteFemme) {
        this.idmeuble = idmeuble;
        this.nommeuble = nommeuble;
        this.idvolume = idvolume;
        this.nomvolume = nomvolume;
        this.datevente = datevente;
        this.annee = annee;
        this.quantiteHomme = quantiteHomme;
        this.quantiteFemme = quantiteFemme;
    }
    public int getIdmeuble() {
        return this.idmeuble;
    }
    public void setIdmeuble(int idmeuble) {
        this.idmeuble = idmeuble;
    }
    public String getNommeuble() {
        return this.nommeuble;
    }
    public void setNommeuble(String nommeuble) {
        this.nommeuble = nommeuble;
    }
    public int getIdvolume() {
        return this.idvolume;
    }
    public void setIdvolume(int idvolume) {
        this.idvolume = idvolume;
    }
    public String getNomvolume() {
        return this.nomvolume;
    }
    public void setNomvolume(String nomvolume) {
        this.nomvolume = nomvolume;
    }
    public String getDatevente() {
        return this.getNomMois(this.datevente);
    }
    public void setDatevente(int datevente) {
        this.datevente = datevente;
    }
    public int getAnnee() {
        return annee;
    }
    public void setAnnee(int annee) {
        this.annee = annee;
    }
    
    public double getQuantiteHomme() {
        return quantiteHomme;
    }
    public void setQuantiteHomme(double quantiteHomme) {
        this.quantiteHomme = quantiteHomme;
    }
    
    public double getQuantiteFemme() {
        return quantiteFemme;
    }
    public void setQuantiteFemme(double quantiteFemme) {
        this.quantiteFemme = quantiteFemme;
    }

    public String v_statistique(String idmeuble, String idvolume, int annee) {
        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM v_statistique WHERE 1=1 AND annee = " + annee);
    
        if (idmeuble != null && idmeuble != "") {
            sqlBuilder.append(" AND idmeuble = ").append(idmeuble);
        }
    
        if (idvolume != null && idvolume != "") {
            sqlBuilder.append(" AND idvolume = ").append(idvolume);
        }
    
        System.out.println("v_statistique sql : " + sqlBuilder.toString());
        return sqlBuilder.toString();
    }

    public String v_statistique_meuble(String idvolume, int annee) {
        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM v_statistique_meuble WHERE 1=1 AND annee = " + annee);
    
        if (idvolume != null && idvolume != "") {
            sqlBuilder.append(" AND idvolume = ").append(idvolume);
        }
    
        System.out.println("v_statistique_meuble sql : " + sqlBuilder.toString());
        return sqlBuilder.toString();
    }

    public List<VStatistique> listStat(String idmeuble, String idvolume, int annee, Connection c) {
        List<VStatistique> listestat = new ArrayList<>();
        String sql = this.v_statistique(idmeuble, idvolume, annee);

        try {
            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                VStatistique vs = new VStatistique(rs.getInt("idmeuble"), rs.getString("nommeuble"), rs.getInt("idvolume"), rs.getString("nomvolume"), rs.getInt("datevente"), rs.getInt("annee"), rs.getDouble("quantite_homme"), rs.getDouble("quantite_femme"));
                listestat.add(vs);
            }
            rs.close();
            s.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listestat;
    }


    public List<VStatistique> listStatMeuble(String idvolume, int annee, Connection c) {
        List<VStatistique> listestat = new ArrayList<>();
        String sql = this.v_statistique_meuble(idvolume, annee);

        try {
            Statement s = c.createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                VStatistique vs = new VStatistique(rs.getInt("idmeuble"), rs.getString("nommeuble"), rs.getInt("idvolume"), rs.getString("nomvolume"), rs.getInt("datevente"), rs.getInt("annee"), rs.getDouble("quantite_homme"), rs.getDouble("quantite_femme"));
                listestat.add(vs);
            }
            rs.close();
            s.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listestat;
    }

    public String getNomMois(int numeroMois) {
        String[] nomsMois = {
            "Janvier", "Février", "Mars", "Avril",
            "Mai", "Juin", "Juillet", "Août",
            "Septembre", "Octobre", "Novembre", "Décembre"
        };
    
        if (numeroMois >= 1 && numeroMois <= 12) {
            return nomsMois[numeroMois - 1];
        } else {
            return "Mois invalide";
        }
    }

    public String getGenre(int codeGenre) {
        if (codeGenre == 1) {
            return "Homme";
        } else if (codeGenre == 11) {
            return "Femme";
        } else {
            return "Genre invalide";
        }
    }
}
