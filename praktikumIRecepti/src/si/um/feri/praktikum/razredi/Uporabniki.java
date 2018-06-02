package si.um.feri.praktikum.razredi;

public class Uporabniki {
	private int id;
	private String ime;
	private String priimek;
	private String email;
	private String geslo;
	private String uporabniskoIme;

	public Uporabniki(){
	
	}
	public Uporabniki(int id, String ime, String priimek, String email, String uporabniskoIme, String geslo){
		this.id=id;
		this.ime=ime;
		this.priimek=priimek;
		this.email=email;
		this.uporabniskoIme=uporabniskoIme;
		this.geslo=geslo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIme() {
		return ime;
	}
	public void setIme(String ime) {
		this.ime = ime;
	}
	public String getPriimek() {
		return priimek;
	}
	public void setPriimek(String priimek) {
		this.priimek = priimek;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGeslo() {
		return geslo;
	}
	public void setGeslo(String geslo) {
		this.geslo = geslo;
	}
	public String getUporabniskoIme() {
		return uporabniskoIme;
	}
	public void setUporabniskoIme(String uporabniskoIme) {
		this.uporabniskoIme = uporabniskoIme;
	}
}