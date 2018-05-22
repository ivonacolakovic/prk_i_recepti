package si.um.feri.praktikum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import si.um.feri.praktikum.razredi.ReceptZaglavlje;
import si.um.feri.praktikum.razredi.TipJedi;

public class TipJediDAO {
DataSource baza;
	
	public TipJediDAO() {
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
		conn.createStatement().execute("CREATE TABLE IF NOT EXISTS TIPJEDI(id_ocena int not null auto_increment primary key,naziv varchar(25) not null)");
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
		conn.createStatement().execute("DROP TABLE IF EXISTS TIPJEDI CASCADE");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
}

public void shrani(TipJedi tj) throws SQLException {
	Connection conn=null;
	try {
		conn=baza.getConnection();

			PreparedStatement ps = conn.prepareStatement("INSERT INTO TIPJEDI(naziv) VALUES (?)");
			ps.setString(1, tj.getNaziv());
			
			ps.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
}

}
	


