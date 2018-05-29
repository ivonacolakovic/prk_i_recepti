package si.um.feri.praktikum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import si.um.feri.praktikum.razredi.Alergeni;


public class AlergeniDAO{
	DataSource baza;
	
	public AlergeniDAO() {
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
			conn.createStatement().execute("CREATE TABLE IF NOT EXISTS ALERGENI(id_alergeni int not null auto_increment primary key, naziv varchar(100) not null)");
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
			conn.createStatement().execute("DROP TABLE IF EXISTS ALERGENI CASCADE");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}
	
	public void shrani(Alergeni r) throws SQLException {
		Connection conn=null;
		//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 //String datum = sdf.format(r.getCasObjave());
		try {
			conn=baza.getConnection();

				PreparedStatement ps = conn.prepareStatement("INSERT INTO ALERGENI(naziv) VALUES (?)");
				ps.setString(1, r.getNaziv());
				
				
				ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}
	
	public List<Alergeni> vrniAlergene() throws Exception {
			
		List<Alergeni> ret = new ArrayList<Alergeni>();
			
			Connection conn=null;
			try {
				conn=baza.getConnection();
				
	
				ResultSet rs=conn.createStatement().executeQuery("select * from alergeni order by naziv");
				while (rs.next()) {
					Alergeni a =new Alergeni(rs.getString("naziv"));
	
					ret.add(a);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
			}
			return ret;
		}
	
	
	public Alergeni najdi(int sifra) throws Exception {
		Alergeni ret = null;
		
		Connection conn=null;
		try {
			conn=baza.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from Alergeni where id_recept=?");
			ps.setInt(1, sifra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ret  = new Alergeni(rs.getString("naziv"));
	
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


	