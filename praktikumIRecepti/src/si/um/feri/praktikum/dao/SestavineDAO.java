package si.um.feri.praktikum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import si.um.feri.praktikum.razredi.Alergeni;
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
			conn.createStatement().execute("CREATE TABLE IF NOT EXISTS SESTAVINE(id_sestavine int not null auto_increment primary key, naziv varchar(100) not null,enota varchar(100) not null, kolicina double(8.2) not null,tk_recept_id int not null)");
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
	
	public void shrani(Sestavine r) throws SQLException {
		Connection conn=null;
		//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 //String datum = sdf.format(r.getCasObjave());
		try {
			conn=baza.getConnection();

				PreparedStatement ps = conn.prepareStatement("INSERT INTO SESTAVINE(naziv, enota, kolicina) VALUES (?, ?, ?)");
				ps.setString(1, r.getNaziv());
				ps.setString(2, r.getEnota());
				ps.setDouble(3, r.getKolicina());
				
				ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}
	
	public List<Sestavine> vrniSestavine(int id) throws Exception {
			
		List<Sestavine> ret = new ArrayList<Sestavine>();
			
			Connection conn=null;
			try {
				conn=baza.getConnection();
				PreparedStatement ps = conn.prepareStatement("select * from sestavine where tk_recept_id=?");
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();while (rs.next()) {
					Sestavine s =new Sestavine(rs.getString("naziv"), rs.getString("enota"), rs.getDouble("kolicina"));
	
					ret.add(s);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
			}
			return ret;
		}
	
	
	public Sestavine najdi(int sifra) throws Exception {
		Sestavine ret = null;
		
		Connection conn=null;
		try {
			conn=baza.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from sestavine where id_sestavine=?");
			ps.setInt(1, sifra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ret  = new Sestavine(rs.getString("naziv"), rs.getString("enota"), rs.getDouble("kolicina"));
	
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return ret;
	}
	
	
	
	}


