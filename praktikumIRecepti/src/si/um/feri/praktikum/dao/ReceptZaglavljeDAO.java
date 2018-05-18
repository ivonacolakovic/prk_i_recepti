package si.um.feri.praktikum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import si.um.feri.praktikum.razredi.ReceptZaglavlje;

public class ReceptZaglavljeDAO {
	DataSource baza;
	
	public ReceptZaglavljeDAO() {
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
			conn.createStatement().execute("CREATE TABLE IF NOT EXISTS RECEPTZAGLAVLJE(id_receptzaglavlje int not null auto_increment primary key, naziv varchar(100) not null, steviloOseb int not null ,casPriprave double not null, steviloKalorije double not null,casObjave Date,kratekOpis varchar(300) not null, slika varchar(500) not null, video varchar(700) not null, mascobe double not null, ogljikoviHidrati double not null, opisPriprave varchar(1000) not null)");
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
			conn.createStatement().execute("DROP TABLE IF EXISTS RECEPTZAGLAVLJE CASCADE");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}
	
	public void shrani(ReceptZaglavlje r) throws SQLException {
		Connection conn=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 String datum = sdf.format(r.getCasObjave());
		try {
			conn=baza.getConnection();

				PreparedStatement ps = conn.prepareStatement("INSERT INTO RECEPTZAGLAVLJE(naziv,steviloOseb,casPriprave,steviloKalorije,casObjave,kratekOpis,slika,video,mascobe,ogljikoviHidrati,opisPriprave) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, r.getNaziv());
				ps.setInt(2, r.getSteviloOseb());
				ps.setDouble(3, r.getCasPriprave());
				ps.setDouble(4, r.getSteviloKalorije());
				ps.setDate(5,java.sql.Date.valueOf(datum));
				ps.setString(6, r.getKratekOpis());
				ps.setString(7, r.getSlika());
				ps.setString(8, r.getVideo());
				ps.setDouble(9, r.getMascobe());
				ps.setDouble(10, r.getOgljikoviHidrati());
				ps.setString(11, r.getOpisPriprave());
				
				
				ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}
}
		
	
	


