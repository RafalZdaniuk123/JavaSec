package ovh.devnote.ksiegarnia.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;
@Entity
@Table(name = "kategorie")
public class Kategoria {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @Column(name = "nazwa")
    private String nazwa;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "kategoria", cascade = CascadeType.ALL)
    private List<Ksiazka> ksiazki;
    public Kategoria() {
    }
    public Kategoria( String id) {
        this.id = Integer.parseInt(id);
    }



    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }
    public String getNazwa() {
        return nazwa;
    }
    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }
    public List<Ksiazka> getKsiazki() {
        return ksiazki;
    }
    public void setKsiazki(List<Ksiazka> ksiazki) {
        this.ksiazki = ksiazki;
    }
    public void addKsiazka(Ksiazka ksiazka) {
        if (ksiazki.isEmpty())
            ksiazki = new ArrayList<>();
        ksiazka.setKategoria(this);
        ksiazki.add(ksiazka);
    }

    @Override
    public String toString() {
        return "Kategoria{" +
                "id=" + id +
                ", nazwa='" + nazwa + '\'' +
                '}';
    }
}