package si.um.feri.praktikum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import si.um.feri.praktikum.razredi.Kuhinja;

public class KuhinjaDAO {
	DataSource baza;
	
	public KuhinjaDAO() {
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
		conn.createStatement().execute("CREATE TABLE IF NOT EXISTS KUHINJA(id_kuhinja int not null auto_increment primary key, naziv varchar(40) not null)");
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
		conn.createStatement().execute("DROP TABLE IF EXISTS KUHINJA CASCADE");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
}
public void shrani(Kuhinja k) throws SQLException {
	Connection conn=null;
	try {
		conn=baza.getConnection();

			PreparedStatement ps = conn.prepareStatement("INSERT INTO KUHINJA(naziv) VALUES (?)");
			ps.setString(1, k.getNaziv());
			
			
			
			ps.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
}
}
	

	


