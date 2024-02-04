package model;

import genericdao.Column;
import genericdao.JDBC;
import genericdao.Table;

import java.sql.SQLException;

import java.util.List;
import java.sql.Connection;
import java.util.ArrayList;

@Table(name = "v_materiel_meuble")
public class VMaterielMeuble extends JDBC {

    @Column(name = "idmateriel_meuble")
    private int idmaterielMeuble;

    @Column(name = "idmeuble")
    private int idmeuble;

    @Column(name = "nommeuble")
    private String nommeuble;

    @Column(name = "idmateriel")
    private int idmateriel;

    @Column(name = "nommateriel")
    private String nommateriel;

    @Column(name = "prix")
    private double prix;

    @Column(name = "qte")
    private double qte;

    @Column(name = "idvolume")
    private int idvolume;

    @Column(name = "nomvolume")
    private String nomvolume;

    @Column(name = "somme")
    private double somme;

    public int getIdmaterielMeuble() {
        return this.idmaterielMeuble;
    }

    public void setIdmaterielMeuble(int idmaterielMeuble) {
        this.idmaterielMeuble = idmaterielMeuble;
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

    public int getIdmateriel() {
        return this.idmateriel;
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

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public double getQte() {
        return this.qte;
    }

    public void setQte(double qte) {
        this.qte = qte;
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

    public double getSomme() {
        return somme;
    }

    public void setSomme(double somme) {
        this.somme = somme;
    }

    public List<Double> sommeQte(List<VMaterielMeuble> listvmm, double quantite) {
        List<Double> sommeQte = new ArrayList<>();
        for (int i = 0; i < listvmm.size(); i++) {
            sommeQte.add(listvmm.get(i).getQte() * quantite);
        }
        return sommeQte;
    }

    public double sommeQte(List<VMaterielMeuble> listvmm, VEtatStock ves, Materiel m, double quantite, Connection c) throws SQLException, ClassNotFoundException {
        double sommeQte = 0;
        // int countAmpy = 0;
        List<VEtatStock> listves = new ArrayList<>();
        // List<Materiel> listm = new ArrayList<>();
        // String exception = "";
        for (int i = 0; i < listvmm.size(); i++) {
            ves.setIdmateriel(listvmm.get(i).getIdmateriel());
            listves = ves.select(c);
            sommeQte = listves.get(i).getReste() - (listvmm.get(i).getQte() * quantite);
            m.setId(listvmm.get(i).getIdmateriel());
            // listm = m.select(c);
            // if (sommeQte >= 0) {
            //     countAmpy++;
            // } else {
            //     exception += "Quantite de materiel insuffisante de " + listm.get(0).getNom() + " de " + (-sommeQte) + "\n";
            // }
        }

        // if (countAmpy != listvmm.size()) {
        //     throw new Exception(exception);
        // }
        return sommeQte;
    }
}
