package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "contruction_volume")
public class ConstructionVolume extends JDBC {
    @Id(name = "id", sequence = "contruction_volume_id_seq")
    private int id;

    @Column(name = "idvolume")
    private int idvolume;

    @Column(name = "nbpersonne")
    private int nbpersonne;

    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getIdvolume() {
        return this.idvolume;
    }
    public void setIdvolume(int idvolume) {
        this.idvolume = idvolume;
    }
    public int getNbpersonne() {
        return this.nbpersonne;
    }
    public void setNbpersonne(int nbpersonne) {
        this.nbpersonne = nbpersonne;
    }
}
