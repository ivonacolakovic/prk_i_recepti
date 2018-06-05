package si.um.feri.praktikum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
		conn.createStatement().execute("CREATE TABLE IF NOT EXISTS OCENA(id_ocena int not null auto_increment primary key,ocena int ,komentar varchar(400),lajk varchar(15), tk_recept_id int not null)");
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
public void shrani(Ocena o) throws SQLException {
	Connection conn=null;
	try {
		conn=baza.getConnection();

			PreparedStatement ps = conn.prepareStatement("INSERT INTO OCENA(ocena,komentar,lajk,tk_recept_id) VALUES (?,?,?,?)");
			ps.setInt(1, o.getOcena());
			ps.setString(2, o.getKomentar());
			ps.setString(3, o.getLajk());
			ps.setInt(4, o.getTk_recept_id());

			ps.executeUpdate();
			
			
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
}

public ArrayList<Ocena> vrniVse(int sifra) throws Exception {
	ArrayList<Ocena> ret = new ArrayList<Ocena>();

	Connection conn=null;
	try {
		conn=baza.getConnection();

		PreparedStatement ps = conn.prepareStatement("select * from ocena where tk_recept_id=?");
		ps.setInt(1, sifra);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Ocena o = new Ocena(rs.getInt("ocena"),rs.getString("komentar"));
			ret.add(o);
		}
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
	return ret;
}

}
	

	





