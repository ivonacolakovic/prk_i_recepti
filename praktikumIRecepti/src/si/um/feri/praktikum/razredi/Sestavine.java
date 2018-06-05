package si.um.feri.praktikum.razredi;


public class Sestavine {

	private int idSestavine;
	private String naziv;
	private String enota;
	private double kolicina;
	private int tk_recept;
	
	
	public Sestavine() {
		
	}
	
public Sestavine(String naziv, double kolicina,String enota ) {
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

	public int getTk_recept() {
		return tk_recept;
	}

	public void setTk_recept(int tk_recept) {
		this.tk_recept = tk_recept;
	}
	
	
}
