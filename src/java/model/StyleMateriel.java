package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "style_materiel")
public class StyleMateriel extends JDBC {
    @Id(name = "id", sequence = "style_materiel_id_seq")
    private int id;

    @Column(name = "idstyle")
    private int idstyle;

    @Column(name = "idmateriel")
    private int idmateriel;

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
    public int getIdmateriel() {
        return this.idmateriel;
    }
    public void setIdmateriel(int idmateriel) {
        this.idmateriel = idmateriel;
    }
}
