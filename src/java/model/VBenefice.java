package model;

import genericdao.Table;
import genericdao.Column;
import genericdao.JDBC;

import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Table(name = "v_benefice")
public class VBenefice extends JDBC {
    @Column(name = "idmeuble")
    private int idmeuble;

    @Column(name = "nommeuble")
    private String nommeuble;

    @Column(name = "idvolume")
    private int idvolume;

    @Column(name = "nomvolume")
    private String nomvolume;

    @Column(name = "prixvente")
    private double prixvente;

    @Column(name = "couttotal")
    private double couttotal;

    @Column(name = "benefice")
    private double benefice;

    public int getIdmeuble() {
        return this.idmeuble;
    }
    public void setIdmeuble(int idmeuble) {
        this.idmeuble = idmeuble;
    }
    public String getNommeuble() {
        return nommeuble;
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
        return nomvolume;
    }
    public void setNomvolume(String nomvolume) {
        this.nomvolume = nomvolume;
    }
    public double getPrixvente() {
        return this.prixvente;
    }
    public void setPrixvente(double prixvente) {
        this.prixvente = prixvente;
    }
    public double getCouttotal() {
        return this.couttotal;
    }
    public void setCouttotal(double couttotal) {
        this.couttotal = couttotal;
    }
    public double getBenefice() {
        return this.benefice;
    }
    public void setBenefice(double benefice) {
        this.benefice = benefice;
    }

    public List<VBenefice> getBeneficeMinMax(double prix_min, double prix_max, Connection c) {
        List<VBenefice> listebenefice = new ArrayList<>();
        String sql = "SELECT * FROM v_benefice WHERE benefice >= ? AND benefice <= ?";

        try {
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setDouble(1, prix_min);
            ps.setDouble(2, prix_max);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                VBenefice vb = new VBenefice();
                vb.setIdmeuble(rs.getInt("idmeuble"));
                vb.setNommeuble(rs.getString("nommeuble"));
                vb.setIdvolume(rs.getInt("idvolume"));
                vb.setNomvolume(rs.getString("nomvolume"));
                vb.setPrixvente(rs.getDouble("prixvente"));
                vb.setCouttotal(rs.getDouble("couttotal"));
                vb.setBenefice(rs.getDouble("benefice"));
                listebenefice.add(vb);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listebenefice;
    }
}
