package si.um.feri.praktikum;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import si.um.feri.praktikum.dao.SestavineDAO;
import si.um.feri.praktikum.razredi.ReceptZaglavlje;
import si.um.feri.praktikum.razredi.Sestavine;

public class Email {
	
	public static void posljiEmail(String mail,ReceptZaglavlje recept) throws Exception {
		int id = recept.getId_recept();
		SestavineDAO sd = new SestavineDAO();
		
		System.out.println("id je" +id);
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("recepti.loveatfirstbite@gmail.com","Praktikum1");
				}
			});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("recepti.loveatfirstbite@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(mail));
			message.setSubject("Recept ki vas bo vsec");
			String text = "Mislimo da ovaj recept vam bo vsec"+
					"\n\n " + recept.getNaziv() +"\n\n "+ recept.getOpisPriprave()
					+"\n\n " +"Celoten nacin priprave lahko pogledate:"+ recept.getVideo()
					+"\n\n " +"Cas priprave recepta:" +recept.getCasPriprave()
					+"\n\n " +"Stevilo kalorije:" +recept.getSteviloKalorije()
					+"\n\n " +"Stevilo mascobe na porcijo (g):"+recept.getMascobe()
					+"\n\n " +"Ogljikovi hidrati na porcijo (g):"+recept.getOgljikoviHidrati()
					+"\n\n " +"Recept in sestavine so pogodni za:" +recept.getSteviloOseb()
					+"\n\n " +"Alergeni:"+recept.getAlergeniSkupaj()
					+"\n\n " +"Sestavine:";
			List<Sestavine> ss =  sd.vrniSestavine(id);
			for(Sestavine s: ss) {
				text += "\n "+s.getNaziv()+" "+s.getKolicina()+s.getEnota();
			}
			message.setText(text);

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
