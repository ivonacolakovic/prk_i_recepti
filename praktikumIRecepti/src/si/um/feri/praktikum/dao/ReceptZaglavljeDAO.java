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
	
	public List<ReceptZaglavlje> vrniVse() throws Exception {
			
		List<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
			
			Connection conn=null;
			try {
				conn=baza.getConnection();
	
				ResultSet rs=conn.createStatement().executeQuery("select * from receptzaglavlje order by naziv");
				while (rs.next()) {
					ReceptZaglavlje rz =new ReceptZaglavlje(rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));
	
					ret.add(rz);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
			}
			return ret;
		}
	
	
	public ReceptZaglavlje najdi(int sifra) throws Exception {
		ReceptZaglavlje ret = null;
		
		Connection conn=null;
		try {
			conn=baza.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from ReceptZaglavlje where id_recept=?");
			ps.setInt(1, sifra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ret  = new ReceptZaglavlje(rs.getString("naziv"), rs.getInt("stviloPorcij"),rs.getDouble("casPriprave"),rs.getString("kratekOpis"),rs.getString("slika"),rs.getString("video"),rs.getDouble("steviloKalorije"),rs.getDouble("mascobe"),rs.getDouble("ogljikoviHidrati"),rs.getString("opisPriprave"), new java.util.Date(rs.getDate("casObjave").getTime()));
	
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return ret;
	}
	
	//dodaj v ocenaDAO foreign key od recepta
	
	public List<ReceptZaglavlje> vrniNajnovejse(){
		// SELECT * FROM ReceptZaglavlje ORDER BY casObjave DESC
		
		return null;
	}
	
	public List<ReceptZaglavlje> vrniTop10(){
		// CREATE OR REPLACE VIEW AS najboljsi (SELECT tk_id_receptZaglavlje, AVG(ocena) AS pov_oc
		// FROM OCENA GROUP BY tk_id_receptZaglavlje ORDER BY pov_oc DESC;
		// SELECT * FROM RECEPTZAGLAVLJE
		// WHERE id_receptzaglavlje = (SELECT TOP 10 tk_id_receptZaglavlje FROM najboljsi;
		//
		
		return null;
	}
	
	public List<ReceptZaglavlje> vrniIskanePoKategorijah(){
		//
		//
		//
		
		return null;
	}

}
		
	
	


