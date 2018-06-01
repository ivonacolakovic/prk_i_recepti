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
import si.um.feri.praktikum.razredi.Sestavine;

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
			conn.createStatement().execute("CREATE TABLE IF NOT EXISTS RECEPTZAGLAVLJE(id_receptzaglavlje int not null auto_increment primary key, naziv varchar(100) not null, steviloOseb int not null ,casPriprave double not null, steviloKalorije double,casObjave Date,kratekOpis varchar(300) not null, slika varchar(500) not null, video varchar(700) not null, mascobe double, ogljikoviHidrati double, opisPriprave varchar(9999) not null, alergeni varchar(200), sezona varchar(100), tipjedi varchar(10) not null , kuhinja varchar(45))");
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

				PreparedStatement ps = conn.prepareStatement("INSERT INTO RECEPTZAGLAVLJE(naziv,steviloOseb,casPriprave,steviloKalorije,casObjave,kratekOpis,slika,video,mascobe,ogljikoviHidrati,opisPriprave, alergeni,sezona,tipjedi,kuhinja) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
				ps.setString(12, r.getAlergeniSkupaj());
				ps.setString(13, r.getSezona());
				ps.setString(14, r.getTipjedi());
				ps.setString(15, r.getKuhinja());
				
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
					ReceptZaglavlje rz =new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));
	
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
			PreparedStatement ps = conn.prepareStatement("select * from ReceptZaglavlje where id_receptzaglavlje=?");
			ps.setInt(1, sifra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ret  = new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getInt("steviloOseb"),rs.getDouble("casPriprave"),rs.getString("kratekOpis"),rs.getString("slika"),rs.getString("video"),rs.getDouble("steviloKalorije"),rs.getDouble("mascobe"),rs.getDouble("ogljikoviHidrati"),rs.getString("opisPriprave"), new java.util.Date(rs.getDate("casObjave").getTime()),rs.getString("alergeni"));
	
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return ret;
	}
	
	

	
	public List<ReceptZaglavlje> vrniNajnovejse() throws SQLException{
		
		
		List<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
			
			Connection conn=null;
			try {
				conn=baza.getConnection();
				ResultSet rs=conn.createStatement().executeQuery("SELECT * FROM ReceptZaglavlje ORDER BY casObjave DESC");
				while (rs.next()) {
					ReceptZaglavlje rz =new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));
	

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
	


	public List<ReceptZaglavlje> vrniTop10  () throws SQLException{

		
		List<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
			
			Connection conn=null;
			try {
				conn=baza.getConnection();
			conn.createStatement().execute("CREATE OR REPLACE VIEW AS najboljsi (SELECT tk_id_receptZaglavlje, AVG(ocena) AS pov_oc FROM OCENA GROUP BY tk_id_receptZaglavlje ORDER BY pov_oc DESC");
				
				ResultSet rs=conn.createStatement().executeQuery(" SELECT * FROM RECEPTZAGLAVLJE WHERE id_receptzaglavlje = (SELECT TOP 10 tk_id_receptZaglavlje FROM najboljsi)");
				while (rs.next()) {
					ReceptZaglavlje rz =new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));
	
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

	
	/*public List<ReceptZaglavlje> vrniIskanePoKategorijah() throws SQLException{

		List<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
			
			Connection conn=null;
			try {
				conn=baza.getConnection();
				
				ResultSet rs=conn.createStatement().executeQuery("SELECT * FROM RECEPTZAGLAVLJE WHERE tk_tipJedi = (SELECT id_TipJedi  FROM TIPJEDI WHERE NAZIV=?");
				while (rs.next()) {
					ReceptZaglavlje rz =new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));
	
					ret.add(rz);
				}
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
			}
			return ret;
	}*/
	
	public ArrayList<ReceptZaglavlje> isciPoSestavinah(String input){
		String[] parts = input.split(",");
		ArrayList<String> sestavine = new ArrayList<String>();
		ArrayList<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
		
		for(int j = 0; j < parts.length; j++){
			sestavine.add(parts[j]);
		}

		ArrayList<ReceptZaglavlje> recepti;
		try {
			recepti = (ArrayList<ReceptZaglavlje>) this.vrniVse();
			for(int i = 0; i < recepti.size(); i++){
				ArrayList<Sestavine> s = recepti.get(i).getSestavine();
				for(int k = 0; k < s.size(); k++){
					for(int m = 0; m < sestavine.size(); m++){
						if(s.get(k).getNaziv().toLowerCase().equals(sestavine.get(m).toLowerCase())){
							ret.add(recepti.get(i));
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
	}
	
	public int vrniZadnjiId() {
		Connection conn=null;
		int id = 99999;
		try {
			conn=baza.getConnection();
			ResultSet rs = conn.createStatement().executeQuery("select max(id_receptzaglavlje) from receptzaglavlje");
			if(rs.next()){
                id=rs.getInt(1);
            }
			//System.out.println("id iz baze "+id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return id;
		
	}
	
	public List<ReceptZaglavlje> najdiPoTip(String tip) throws Exception {
		
		List<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
			
			Connection conn=null;
			try {
				conn=baza.getConnection();
				PreparedStatement ps = conn.prepareStatement("select * from ReceptZaglavlje where tipjedi=?");
				ps.setString(1, tip);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					ReceptZaglavlje rz =new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));
	

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
	
public List<ReceptZaglavlje> najdiPoSezona(String sezona) throws Exception {
		
		List<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
			
			Connection conn=null;
			try {
				conn=baza.getConnection();
				PreparedStatement ps = conn.prepareStatement("select * from ReceptZaglavlje where sezona=?");
				ps.setString(1, sezona);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					ReceptZaglavlje rz =new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));
	

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
public List<ReceptZaglavlje> najdiPoCas(String cas) throws Exception {
	
	List<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
		double cas1 = Double.parseDouble(cas);
		Connection conn=null;
		try {
			conn=baza.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from ReceptZaglavlje where casPriprave<?");
			ps.setDouble(1, cas1);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ReceptZaglavlje rz =new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));


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
public List<ReceptZaglavlje> najdiPoKuhinja(String kuhinja) throws Exception {
	
	List<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
		
		Connection conn=null;
		try {
			conn=baza.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from ReceptZaglavlje where kuhinja=?");
			ps.setString(1, kuhinja);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ReceptZaglavlje rz =new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));


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


	
	
	
	
	
	
	

}
		
	
	


