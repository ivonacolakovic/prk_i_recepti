package si.um.feri.praktikum.razredi;

import java.util.ArrayList;

public class Avtor {

	private int idAvtor;
	private String ime;
	private ArrayList<ReceptZaglavlje> recepti;
	
	
	public int getIdAvtor() {
		return idAvtor;
	}
	public void setIdAvtor(int idAvtor) {
		this.idAvtor = idAvtor;
	}
	public String getIme() {
		return ime;
	}
	public void setIme(String ime) {
		this.ime = ime;
	}
	public ArrayList<ReceptZaglavlje> getRecepti() {
		return recepti;
	}
	public void setRecepti(ArrayList<ReceptZaglavlje> recepti) {
		this.recepti = recepti;
	}
	
}
