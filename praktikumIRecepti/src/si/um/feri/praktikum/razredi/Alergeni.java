package si.um.feri.praktikum.razredi;

public class Alergeni {

	private int idAlergeni;
	private String naziv;
	
	public Alergeni() {};
	public Alergeni(String naziv) {
	this.naziv=naziv;
	}
	
	
	
	public int getIdAlergeni() {
		return idAlergeni;
	}
	public void setIdAlergeni(int idAlergeni) {
		this.idAlergeni = idAlergeni;
	}
	public String getNaziv() {
		return naziv;
	}
	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}
	
	
}
