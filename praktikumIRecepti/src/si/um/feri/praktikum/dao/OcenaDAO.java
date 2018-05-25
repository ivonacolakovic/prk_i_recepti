package si.um.feri.praktikum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import si.um.feri.praktikum.razredi.Ocena;
import si.um.feri.praktikum.razredi.ReceptZaglavlje;


public class OcenaDAO {
	DataSource baza;
	
	public OcenaDAO() {
	try {
		baza=(DataSource)new InitialContext().lookup("java:/prk_i_recepti");	
		kreirajTabele();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

public void kreirajTabele() throws Exception {
	Connection conn=null;
	try {
		conn=baza.getConnection();
		conn.createStatement().execute("CREATE TABLE IF NOT EXISTS OCENA(id_ocena int not null auto_increment primary key,ocena int not null,komentar varchar(400) not null, tk_recept_id int not null)");
		} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
}

public void pobrisiTabele() throws Exception {
	Connection conn=null;
	try {
		conn=baza.getConnection();
		conn.createStatement().execute("DROP TABLE IF EXISTS OCENA CASCADE");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
}
public void shrani(ReceptZaglavlje r, Ocena o) throws SQLException {
	Connection conn=null;
	try {
		conn=baza.getConnection();

			PreparedStatement ps = conn.prepareStatement("INSERT INTO OCENA(ocena,komentar) VALUES (?,?,?)");
			ps.setInt(1, o.getOcena());
			ps.setString(2, o.getKomentar());
			ps.setInt(3, r.getId_recept());

			ps.executeUpdate();
			
			shraniKomentar (r,o);
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
}

public void shraniKomentar(ReceptZaglavlje r, Ocena o) throws SQLException {
	Connection conn=null;
	int sifra = r.getId_recept();
	try {
		conn=baza.getConnection();

			PreparedStatement ps = conn.prepareStatement("update receptzaglavlje set tk_id_ocena=? where id_recept=?");
			ps.setInt(1, o.getIdOcena());
			ps.setInt(2, sifra);
			

			ps.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
	
	
}


}
	

	





