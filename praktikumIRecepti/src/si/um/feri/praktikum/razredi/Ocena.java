package si.um.feri.praktikum.razredi;

public class Ocena {

	private int idOcena;
	private String komentar;
	private int ocena;
	private String lajk;
	private int tk_recept_id;
	
	public Ocena () {
		System.out.println("ocena");
	}
	
	
	public Ocena(int ocena,String komentar) {
		this.ocena=ocena;
		this.komentar=komentar;
		
		
	}
	
	public Ocena(String like){
		
	}
	
	public int getIdOcena() {
		return idOcena;
	}
	public void setIdOcena(int idOcena) {
		this.idOcena = idOcena;
	}
	public String getKomentar() {
		return komentar;
	}
	public void setKomentar(String komentar) {
		this.komentar = komentar;
	}
	public int getOcena() {
		return ocena;
	}
	public void setOcena(int ocena) {
		this.ocena = ocena;
	}


	public int getTk_recept_id() {
		return tk_recept_id;
	}


	public void setTk_recept_id(int tk_recept_id) {
		this.tk_recept_id = tk_recept_id;
	}


	public String getLajk() {
		return lajk;
	}


	public void setLajk(String lajk) {
		this.lajk = lajk;
	}
	
	
	
	
}
