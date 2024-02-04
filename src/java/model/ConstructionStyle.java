package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "construction_style")
public class ConstructionStyle extends JDBC {
    @Id(name = "id", sequence = "contruction_style_id_seq")
    private int id;

    @Column(name = "idstyle")
    private int idstyle;

    @Column(name = "duree")
    private int duree;

    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getIdstyle() {
        return this.idstyle;
    }
    public void setIdstyle(int idstyle) {
        this.idstyle = idstyle;
    }
    public int getDuree() {
        return this.duree;
    }
    public void setDuree(int duree) {
        this.duree = duree;
    }
}
