package si.um.feri.praktikum.razredi;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import si.um.feri.praktikum.dao.ReceptZaglavljeDAO;

public class PDF {
    private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
    private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
    public void izprintajPDF(ReceptZaglavlje recept){
    	
    	try {
    		
//    		ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
//    		ReceptZaglavlje recept = rzd.najdi(id);
    	
    	
    	String file_name="C:\\Users\\test_pdf.pdf";
    	Document document = new Document();
    	
    	PdfWriter.getInstance(document, new FileOutputStream(file_name));
    	
    	document.open();
    	
    	Paragraph para = new Paragraph( recept.getNaziv(), catFont);
      	Paragraph g = new Paragraph("KRATEK OPIS: " + recept.getKratekOpis(), smallBold);
     	Paragraph s = new Paragraph("STEVILO OSEB: " + recept.getSteviloOseb(), smallBold);
     	Paragraph c = new Paragraph("CAS PRIPRAVE: " + String.valueOf(recept.getCasPriprave()) + "minut" , smallBold);
     	Paragraph k = new Paragraph("STEVILO KALORIJE: " + String.valueOf(recept.getSteviloKalorije()) + "kcal" , smallBold);
    	Paragraph m = new Paragraph("MASCOBE: " + String.valueOf(recept.getMascobe()) + "g", smallBold);
    	Paragraph o = new Paragraph("OGLJIKOVI HIDRATI: "+ String.valueOf(recept.getOgljikoviHidrati()) + "g" , smallBold);
    	Paragraph a = new Paragraph("ALEGENI: " +recept.getAlergeniSkupaj(), smallBold);
    	Paragraph np = new Paragraph("OPIS PRIPRAVE: " + recept.getOpisPriprave(), smallBold);
    	
    	
    	Paragraph sn = null ;
		Paragraph sk  = null;
		Paragraph se  = null;
    	recept.setSestavine(recept.getId_recept());
    	ArrayList<Sestavine> sestavine = (ArrayList<Sestavine>) recept.getSestavine();
    	System.out.println("kjhgfdsasdfghjkloplkjhg");
    	String sestavinee = "";
    	for(int i=0;i<sestavine.size();i++){ 
    		if(i<sestavine.size()-1) {
    		    sestavinee += sestavine.get(i).getNaziv() + " " + String.valueOf(sestavine.get(i).getKolicina()) + sestavine.get(i).getEnota() + ", "; 
    		}else{
    			sestavinee += sestavine.get(i).getNaziv() + " " + String.valueOf(sestavine.get(i).getKolicina()) + sestavine.get(i).getEnota(); 
    		}    	 

    	}
    	sn = new Paragraph("SESTAVINE: " + sestavinee);
    	
    	
    	
    	
    	
    	
    	document.add(para);
    	document.add(g);
    	document.add(s);
    	document.add(c);
    	document.add(k);
    	document.add(m);
    	document.add(o);
    	document.add(a);
    	document.add(np);
    	
    	
    	

      	document.add(sn);
    	
    	
    	
    	System.out.println("konec");
    	
    	
    	document.close();
    	
    	} catch(Exception e) {
    		System.err.println(e);
    	}
    	

    }
    private String vrniBrezSumnikov(String input) {
    	    	input = input.replaceAll("Š", "S");
    	    	input = input.replaceAll("È", "C");
    	    	input = input.replaceAll("Ž", "Z");
    	    	input = input.replaceAll("š", "s");
    	    	input = input.replaceAll("è", "c");
    	    	input = input.replaceAll("ž", "z");
    	   	return input;
    	    }
}