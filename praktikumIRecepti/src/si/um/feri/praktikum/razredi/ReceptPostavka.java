package si.um.feri.praktikum.razredi;

public class ReceptPostavka {

	private int idReceptPos;
	private double kolicina;
	private Sestavine sestavine;
	private ReceptZaglavlje recZag;
	
	
	public int getIdReceptPos() {
		return idReceptPos;
	}
	public void setIdReceptPos(int idReceptPos) {
		this.idReceptPos = idReceptPos;
	}
	public double getKolicina() {
		return kolicina;
	}
	public void setKolicina(double kolicina) {
		this.kolicina = kolicina;
	}
	public Sestavine getSestavine() {
		return sestavine;
	}
	public void setSestavine(Sestavine sestavine) {
		this.sestavine = sestavine;
	}
	public ReceptZaglavlje getRecZag() {
		return recZag;
	}
	public void setRecZag(ReceptZaglavlje recZag) {
		this.recZag = recZag;
	}
	
}
