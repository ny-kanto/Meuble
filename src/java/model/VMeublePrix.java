package model;

import genericdao.Column;
import genericdao.JDBC;
import genericdao.Table;

import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Table(name = "v_meuble_prix")
public class VMeublePrix extends JDBC {

    @Column(name = "idmeuble")
    private int idmeuble;

    @Column(name = "nommeuble")
    private String nommeuble;

    @Column(name = "idvolume")
    private int idvolume;

    @Column(name = "nomvolume")
    private String nomvolume;

    @Column(name = "sommefinale")
    private double sommefinale;

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

    public double getSommefinale() {
        return this.sommefinale;
    }

    public void setSommefinale(double sommefinale) {
        this.sommefinale = sommefinale;
    }

    public List<VMeublePrix> getMeubleMinMax(double prix_min, double prix_max, Connection c) {
        List<VMeublePrix> listemeuble = new ArrayList<>();
        String sql = "select * from v_meuble_prix where sommefinale >= ? AND sommefinale <= ?";

        try {
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setDouble(1, prix_min);
            ps.setDouble(2, prix_max);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                VMeublePrix vmm = new VMeublePrix();
                vmm.setIdmeuble(rs.getInt("idmeuble"));
                vmm.setNommeuble(rs.getString("nommeuble"));
                vmm.setIdvolume(rs.getInt("idvolume"));
                vmm.setNomvolume(rs.getString("nomvolume"));
                vmm.setSommefinale(rs.getDouble("sommefinale"));
                listemeuble.add(vmm);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listemeuble;
    }
}
