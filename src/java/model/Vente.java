package model;

import java.sql.Date;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "vente")
public class Vente extends JDBC {
    @Id(name = "id", sequence = "vente_id_seq")
    private int id;

    @Column(name = "idclient")
    private int idclient;

    @Column(name = "idmeuble")
    private int idmeuble;

    @Column(name = "idvolume")
    private int idvolume;

    @Column(name = "datevente")
    private Date datevente;

    @Column(name = "qte")
    private double qte;

    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getIdclient() {
        return this.idclient;
    }
    public void setIdclient(int idclient) {
        this.idclient = idclient;
    }
    public int getIdmeuble() {
        return this.idmeuble;
    }
    public void setIdmeuble(int idmeuble) {
        this.idmeuble = idmeuble;
    }
    public int getIdvolume() {
        return this.idvolume;
    }
    public void setIdvolume(int idvolume) {
        this.idvolume = idvolume;
    }
    public Date getDatevente() {
        return this.datevente;
    }
    public void setDatevente(Date datevente) {
        this.datevente = datevente;
    }
    public double getQte() {
        return this.qte;
    }
    public void setQte(double qte) {
        this.qte = qte;
    }
}
