package si.um.feri.praktikum.razredi;

import java.util.ArrayList;
import java.util.Date;

import si.um.feri.praktikum.dao.SestavineDAO;

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
	private String kuhinja;
	private String tipjedi;
	private String sezona;
	private ArrayList<Ocena> ocena = new ArrayList<>();
	//private ArrayList<String> alergeni = new ArrayList<>();
	private ArrayList<Sestavine> sestavine = new ArrayList<>();
	private String alergeniSkupaj;
	
	
	public ReceptZaglavlje() {
		
	}
	public ReceptZaglavlje(int id_recept,String naziv, String slika, String kratekOpis) {
		this.id_recept=id_recept;
		this.naziv=naziv;
		this.slika=slika;
		this.kratekOpis=kratekOpis;
		
	}
	
	public ReceptZaglavlje(int id_recept,String naziv,int steviloOseb,double casPriprave,String kratekOpis,String slika,String video, double steviloKalorije, double mascobe, double ogljikoviHidrati,String opisPriprave, Date casObjave,String alergeniSkupaj ) {
		this.id_recept=id_recept;
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
		this.alergeniSkupaj=alergeniSkupaj;
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
	
	public ArrayList<Ocena> getOcena() {
		return ocena;
	}
	public void setOcena(ArrayList<Ocena> ocena) {
		this.ocena = ocena;
	}
	
	public String getKuhinja() {
		return kuhinja;
	}
	public void setKuhinja(String kuhinja) {
		this.kuhinja = kuhinja;
	}
	public String getTipjedi() {
		return tipjedi;
	}
	public void setTipjedi(String tipjedi) {
		this.tipjedi = tipjedi;
	}
	public String getSezona() {
		return sezona;
	}
	public void setSezona(String sezona) {
		this.sezona = sezona;
	}
	public ArrayList<Sestavine> getSestavine() {
		return sestavine;
	}
	public void setSestavine(int id_recept) throws Exception {
		SestavineDAO sd = new SestavineDAO();
		sestavine = (ArrayList<Sestavine>) sd.vrniSestavine( id_recept); 
	}
	public String getAlergeniSkupaj() {
		return alergeniSkupaj;
	}
	public void setAlergeniSkupaj(String alergeniSkupaj) {
		this.alergeniSkupaj = alergeniSkupaj;
	}
	
	

	
	
	
	
	

}
