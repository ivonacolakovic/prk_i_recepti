package si.um.feri.praktikum.razredi;

public class Sestavine {

	private int idSestavine;
	private String naziv;
	private String enota;
	private double kolicina;
	
	public Sestavine() {
		
	}
	
public Sestavine(String naziv,String enota, double kolicina ) {
	this.enota=enota;
	this.naziv=naziv;
	this.kolicina=kolicina;
		
	}
		
	
	public int getIdSestavine() {
		return idSestavine;
	}
	public void setIdSestavine(int idSestavine) {
		this.idSestavine = idSestavine;
	}
	public String getNaziv() {
		return naziv;
	}
	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}
	public String getEnota() {
		return enota;
	}
	public void setEnota(String enota) {
		this.enota = enota;
	}
	
	
	public double getKolicina() {
		return kolicina;
	}
	public void setKolicina(double kolicina) {
		this.kolicina = kolicina;
	}
	
}
