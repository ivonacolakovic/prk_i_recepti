package si.um.feri.praktikum.razredi;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import com.itextpdf.text.Document;

import com.itextpdf.text.Element;

import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import si.um.feri.praktikum.dao.ReceptZaglavljeDAO;

public class PDF {

	
	private Document document = new Document();
	
    private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
    private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12);
    
   public void izprintajPDF(ReceptZaglavlje recept){

    	
    	try {
    		

//    		ReceptZaglavljeDAO rzd = new ReceptZaglavljeDAO();
//    		ReceptZaglavlje recept = rzd.najdi(id);
    	

    	
    	String file_name="C:\\Users\\test_pdf.pdf";
    	
    	
    	PdfWriter.getInstance(document, new FileOutputStream(file_name));
    	


 		document.open();
 		Paragraph para = new Paragraph(recept.getNaziv() , catFont );
 	    Paragraph g = new Paragraph("\n" + recept.getKratekOpis() , smallBold);
 	    Paragraph s = new Paragraph("\n" + "Porcij: " + recept.getSteviloOseb(), smallBold);
     	Paragraph c = new Paragraph("Cas priprave: " + String.valueOf(recept.getCasPriprave()) + " minut ", smallBold);
     	Paragraph k = new Paragraph("\n" + "Kalorije: " + String.valueOf(recept.getSteviloKalorije()) + " kcal", smallBold);
    	Paragraph m = new Paragraph("Mascobe: " + String.valueOf(recept.getMascobe()) + " g", smallBold);
    	Paragraph o = new Paragraph("Ogljikovi hidrati: "+ String.valueOf(recept.getOgljikoviHidrati()) + " g", smallBold);
    	Paragraph a = new Paragraph("\n" + "Alergeni: " +recept.getAlergeniSkupaj(), smallBold);
    	Paragraph np = new Paragraph("\n" + "OPIS PRIPRAVE: " + "\n" + recept.getOpisPriprave(), smallBold);
    	Paragraph sest = new Paragraph("\n" + "SESTAVINE: " + "\n" + "\n" , smallBold);

    	
   	
    	Paragraph sn = null ;
		Paragraph sk  = null;
		Paragraph se  = null;
		
		
    	recept.setSestavine(recept.getId_recept());
    	ArrayList<Sestavine> sestavine = (ArrayList<Sestavine>) recept.getSestavine();
    	
    	PdfPTable table = new PdfPTable(2);
	    PdfPCell c1 = new PdfPCell(new Phrase("Naziv", smallBold));
	    c1.setHorizontalAlignment(Element.ALIGN_LEFT);
	    table.addCell(c1);
	    c1 = new PdfPCell(new Phrase("Kolicina", smallBold));
	    c1.setHorizontalAlignment(Element.ALIGN_LEFT);
	    table.addCell(c1);
	   
	
	    table.setHeaderRows(1);
	    for(Sestavine ss : recept.getSestavine()) {
	    	table.addCell(ss.getNaziv());
	    	table.addCell(ss.getKolicina() + ss.getEnota());
	    	
	    }
    	
    	//sn = new Paragraph("SESTAVINE: " + "\n" + sestavinee, smallBold);
    	
  
    	
    	
    	
    	
    	document.add(para);
    	document.add(g);
    	document.add(s);
    	document.add(c);
    	document.add(k);
    	document.add(m);
    	document.add(o);
    	document.add(a);
    	document.add(np);
    	document.add(sest);
    	document.add(table);
    	
    	
    	

      	//document.add(sn);
    	
    	
    	
    	System.out.println("konec");
    	
    	
    	document.close();
    	
    	} catch(Exception e) {
    		System.err.println(e);
    	}
    	

    }
  
}