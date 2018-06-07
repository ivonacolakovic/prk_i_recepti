package si.um.feri.praktikum.razredi;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import si.um.feri.praktikum.dao.ReceptZaglavljeDAO;

public class PDF {
    public void izprintajPDF(ReceptZaglavlje recept){
    	
    	try {
    		
//    		ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
//    		ReceptZaglavlje recept = rzd.najdi(id);
    		
    	
    	String file_name="C:\\Users\\Ivana\\Desktop\\PRAKTIKUM 1\\generate_pdf\\test_pdf.pdf";
    	Document document = new Document();
    	
    	PdfWriter.getInstance(document, new FileOutputStream(file_name));
    	
    	document.open();
    	
    	Paragraph para = new Paragraph("IME: " + recept.getNaziv());
      	Paragraph g = new Paragraph(recept.getKratekOpis());
     	Paragraph s = new Paragraph(recept.getSteviloOseb());
     	Paragraph c = new Paragraph(String.valueOf(recept.getCasPriprave()));
     	Paragraph k = new Paragraph(String.valueOf(recept.getSteviloKalorije()));
    	Paragraph m = new Paragraph(String.valueOf(recept.getMascobe()));
    	Paragraph o = new Paragraph(String.valueOf(recept.getOgljikoviHidrati()));
    	Paragraph a = new Paragraph(recept.getAlergeniSkupaj());
    	Paragraph np = new Paragraph(recept.getOpisPriprave());
    	
    	
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
}