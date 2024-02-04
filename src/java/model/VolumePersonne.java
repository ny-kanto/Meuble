package model;

import genericdao.Column;
import genericdao.Id;
import genericdao.JDBC;
import genericdao.Table;

@Table(name = "volume_personne")
public class VolumePersonne extends JDBC {
    @Id(name = "id", sequence = "volume_personne_id_seq")
    private int id;

    @Column(name = "idvolume")
    private int idvolume;

    @Column(name = "idpersonne")
    private int idpersonne;

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
    public int getIdpersonne() {
        return this.idpersonne;
    }
    public void setIdpersonne(int idpersonne) {
        this.idpersonne = idpersonne;
    }
}
