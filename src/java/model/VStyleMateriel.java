package model;

import genericdao.Column;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "v_style_materiel")
public class VStyleMateriel extends JDBC {
    @Column(name = "idstyle_materiel")
    private int idstyleMateriel;

    @Column(name = "idstyle")
    private int idstyle;

    @Column(name = "nomstyle")
    private String nomstyle;

    @Column(name = "idmateriel")
    private int idmateriel;

    @Column(name = "nommateriel")
    private String nommateriel;

    public int getIdstyleMateriel() {
        return this.idstyleMateriel;
    }
    public void setIdstyleMateriel(int idstyleMateriel) {
        this.idstyleMateriel = idstyleMateriel;
    }
    public int getIdstyle() {
        return this.idstyle;
    }
    public void setIdstyle(int idstyle) {
        this.idstyle = idstyle;
    }
    public String getNomstyle() {
        return this.nomstyle;
    }
    public void setNomstyle(String nomstyle) {
        this.nomstyle = nomstyle;
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
}
