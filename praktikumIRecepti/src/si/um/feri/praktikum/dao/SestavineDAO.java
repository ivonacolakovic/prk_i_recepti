package si.um.feri.praktikum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import si.um.feri.praktikum.razredi.ReceptZaglavlje;
import si.um.feri.praktikum.razredi.Sestavine;
import si.um.feri.praktikum.razredi.TipJedi;

public class SestavineDAO {
DataSource baza;
	
	public SestavineDAO() {
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
		conn.createStatement().execute("CREATE TABLE IF NOT EXISTS SESTAVINE(id_ocena int not null auto_increment primary key,naziv varchar(25) not null,enota varchar(5) )");
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
		conn.createStatement().execute("DROP TABLE IF EXISTS SESTAVINE CASCADE");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
	}
}

public void shrani(Sestavine s) {
}}
