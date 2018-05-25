package si.um.feri.praktikum.razredi;

import java.util.ArrayList;
import java.util.Date;

public class ReceptZaglavlje {
	private int id_recept;
	private String naziv;
	private int steviloOseb;
	private double casPriprave;
	private String kratekOpis;
	private String slika;
	private String video;
	private double steviloKalorije;
	private double mascobe;
	private double ogljikoviHidrati;
	private String opisPriprave;
	private Date casObjave;
	private TipJedi tk_id_tipJedi;
	private Sezona tk_id_sezona;
	private Kuhinja tk_id_kuhinja;
	private ArrayList<Ocena> ocena = new ArrayList<>();
	private ArrayList<Alergeni> alergeni = new ArrayList<>();
	private ArrayList<Sestavine> sestavine = new ArrayList<>();
	
	
	public ReceptZaglavlje() {
		
	}
	public ReceptZaglavlje(String naziv, String slika, String kratekOpis) {
		this.naziv=naziv;
		this.slika=slika;
		this.kratekOpis=kratekOpis;
		
	}
	
	public ReceptZaglavlje(String naziv,int steviloOseb,double casPriprave,String kratekOpis,String slika,String video, double steviloKalorije, double mascobe, double ogljikoviHidrati,String opisPriprave, Date casObjave ) {
		this.naziv=naziv;
		this.steviloOseb=steviloOseb;
		this.casPriprave=casPriprave;
		this.kratekOpis=kratekOpis;
		this.slika=slika;
		this.video=video;
		this.steviloKalorije=steviloKalorije;
		this.mascobe=mascobe;
		this.ogljikoviHidrati=ogljikoviHidrati;
		this.opisPriprave=opisPriprave;
		this.casObjave=casObjave;
	}
	
	public int getId_recept() {
		return id_recept;
	}

	public void setId_recept(int id_recept) {
		this.id_recept = id_recept;
	}

	public String getNaziv() {
		return naziv;
	}
	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}
	public int getSteviloOseb() {
		return steviloOseb;
	}
	public void setSteviloOseb(int steviloOseb) {
		this.steviloOseb = steviloOseb;
	}
	public double getCasPriprave() {
		return casPriprave;
	}
	public void setCasPriprave(double casPriprave) {
		this.casPriprave = casPriprave;
	}
	public String getKratekOpis() {
		return kratekOpis;
	}
	public void setKratekOpis(String kratekOpis) {
		this.kratekOpis = kratekOpis;
	}
	public String getSlika() {
		return slika;
	}
	public void setSlika(String slika) {
		this.slika = slika;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public double getSteviloKalorije() {
		return steviloKalorije;
	}
	public void setSteviloKalorije(double steviloKalorije) {
		this.steviloKalorije = steviloKalorije;
	}
	public double getMascobe() {
		return mascobe;
	}
	public void setMascobe(double mascobe) {
		this.mascobe = mascobe;
	}
	public double getOgljikoviHidrati() {
		return ogljikoviHidrati;
	}
	public void setOgljikoviHidrati(double ogljikoviHidrati) {
		this.ogljikoviHidrati = ogljikoviHidrati;
	}
	public String getOpisPriprave() {
		return opisPriprave;
	}
	public void setOpisPriprave(String opisPriprave) {
		this.opisPriprave = opisPriprave;
	}
	public Date getCasObjave() {
		return casObjave;
	}
	public void setCasObjave(Date casObjave) {
		this.casObjave = casObjave;
	}
	public TipJedi getTk_id_tipJedi() {
		return tk_id_tipJedi;
	}
	public void setTk_id_tipJedi(TipJedi tk_id_tipJedi) {
		this.tk_id_tipJedi = tk_id_tipJedi;
	}
	public Sezona getTk_id_sezona() {
		return tk_id_sezona;
	}
	public void setTk_id_sezona(Sezona tk_id_sezona) {
		this.tk_id_sezona = tk_id_sezona;
	}
	public Kuhinja getTk_id_kuhinja() {
		return tk_id_kuhinja;
	}
	public void setTk_id_kuhinja(Kuhinja tk_id_kuhinja) {
		this.tk_id_kuhinja = tk_id_kuhinja;
	}
	public ArrayList<Ocena> getOcena() {
		return ocena;
	}
	public void setOcena(ArrayList<Ocena> ocena) {
		this.ocena = ocena;
	}
	public ArrayList<Alergeni> getAlergeni() {
		return alergeni;
	}
	public void setAlergeni(ArrayList<Alergeni> alergeni) {
		this.alergeni = alergeni;
	}
	public ArrayList<Sestavine> getSestavine() {
		return sestavine;
	}
	public void setSestavine(ArrayList<Sestavine> sestavine) {
		this.sestavine = sestavine;
	}
	

	
	
	
	
	

}
