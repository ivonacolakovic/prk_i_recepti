package si.um.feri.praktikum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import si.um.feri.praktikum.razredi.ReceptZaglavlje;
import si.um.feri.praktikum.razredi.Sestavine;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
			conn.createStatement().execute("CREATE TABLE IF NOT EXISTS RECEPTZAGLAVLJE(id_receptzaglavlje int not null auto_increment primary key, naziv varchar(100) not null, steviloOseb int not null ,casPriprave double not null, steviloKalorije double,casObjave Date,kratekOpis varchar(300) not null, slika varchar(9999) not null, video varchar(700) not null, mascobe double, ogljikoviHidrati double, opisPriprave varchar(9999) not null, alergeni varchar(200), sezona varchar(100), tipjedi varchar(10) not null , kuhinja varchar(45), tk_uporabnik int not null)");
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

				PreparedStatement ps = conn.prepareStatement("INSERT INTO RECEPTZAGLAVLJE(naziv,steviloOseb,casPriprave,steviloKalorije,casObjave,kratekOpis,slika,video,mascobe,ogljikoviHidrati,opisPriprave, alergeni,sezona,tipjedi,kuhinja,tk_uporabnik) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
				ps.setInt(16, r.getTk_uporabnik());
				
				ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}
	public void spremeniRecept(ReceptZaglavlje r,int sifra) throws Exception {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 String datum = sdf.format(r.getCasObjave());
		
		Connection conn=null;
		try {
			conn=baza.getConnection();
				PreparedStatement ps = conn.prepareStatement("update receptzaglavlje set naziv=?,steviloOseb=?,casPriprave=?,steviloKalorije=?,casObjave=?,kratekOpis=?,slika=?,video=?,mascobe=?,ogljikoviHidrati=?,opisPriprave=?, alergeni=?,sezona=?,tipjedi=?,kuhinja=? where id_receptzaglavlje=?");
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
				ps.setInt(16, sifra);
				ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}
	
	public void izbrisiRecept(int id, int sifra) throws SQLException {
		
	Connection conn=null;
	 try 
	 {  
    conn=baza.getConnection();
	PreparedStatement st = conn.prepareStatement("DELETE FROM receptzaglavlje WHERE tk_uporabnik=? and id_receptzaglavlje=?");
	st.setInt(1,id);
	st.setInt(2, sifra);;
	st.executeUpdate(); 
	PreparedStatement st1 = conn.prepareStatement("DELETE FROM sestavine WHERE tk_recept_id=?");
	st1.setInt(1, sifra);
	st1.executeUpdate(); 
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
			conn.createStatement().execute("CREATE OR REPLACE VIEW najboljsi AS \r\n" + 
					"(SELECT tk_recept_id, AVG(ocena) AS pov_oc \r\n" + 
					"FROM OCENA GROUP BY tk_recept_id ORDER BY pov_oc DESC)");
				
				ResultSet rs=conn.createStatement().executeQuery("SELECT * FROM RECEPTZAGLAVLJE \r\n" + 
						"WHERE id_receptzaglavlje IN \r\n" + 
						"(SELECT tk_recept_id FROM najboljsi ORDER BY pov_oc) LIMIT 10");
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

	
	public List<ReceptZaglavlje> vrniIskanePoKategorijah(String tipJedi, String sezona, String kuhinja, String casPriprave) throws SQLException{
		//	System.out.println("usli u metodu");
		//Double d = new Double(casPriprave);
		double cp ; 
		List<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
			//System.out.println(tipJedi.equals(null));
		String query = null;
			Connection conn=null;
			if(!tipJedi.equals("ostalo")) {
				tipJedi = "'"+tipJedi+"'";
			}else{
				tipJedi = null;
			}
			if(!sezona.equals("ostalo")) {
				sezona = "'"+sezona+"'";
			}else {
				sezona = null;
			}
			if(!kuhinja.equals("ostalo")) {
				kuhinja = "'"+kuhinja+"'";
			}else {
				kuhinja = null;
			}
			if(!casPriprave.equals("ostalo")) {
				cp = Double.parseDouble(casPriprave);
			}else {
				cp = 0;
			}
			//System.out.println(tipJedi.equals(null));
			query = "SELECT * FROM receptzaglavlje WHERE (IFNULL("+tipJedi+", 'tipjedi') = 'tipjedi' OR tipjedi="+tipJedi+") AND (IFNULL("+sezona+", 'sezona') = 'sezona' OR sezona="+sezona+") AND (IFNULL("+kuhinja+", 'kuhinja') = 'kuhinja' OR kuhinja="+kuhinja+") AND (IFNULL("+cp+", 0) = 0 OR casPriprave<="+cp+")";
			System.out.println(query);
			try {
				conn=baza.getConnection();
				Statement ps = conn.createStatement();
				
				ResultSet rs = ps.executeQuery(query);
				
				while (rs.next()) {
					//System.out.println("tu sam ");
					ReceptZaglavlje rz =new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));
					
					//System.out.println("iz baze: "+rz.getNaziv());
					ret.add(rz);
				}
				//System.out.println("konec");
				rs.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
			}
			return ret;
	}
	
	public ArrayList<ReceptZaglavlje> isciPoSestavinah(String input){
		
		System.out.println("usli u metodu");
		System.out.println(input);
		String[] parts = input.split(",");
		ArrayList<String> sestavine = new ArrayList<String>();
		ArrayList<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
		
		
		for(int j = 0; j < parts.length; j++){
			sestavine.add(parts[j]);
		}

		ArrayList<ReceptZaglavlje> recepti;
		try {
			recepti = (ArrayList<ReceptZaglavlje>) this.vrniVse();
			//vsi recepti
			for(int i = 0; i < recepti.size(); i++){
				recepti.get(i).setSestavine(recepti.get(i).getId_recept());
				ArrayList<Sestavine> s = recepti.get(i).getSestavine();
				//sestavine iz enega recepta
				for(int k = 0; k < s.size(); k++){
					//sestavine iz vnosa
					for(int m = 0; m < sestavine.size(); m++){
						if((s.get(k).getNaziv().toLowerCase()).equals((sestavine.get(m).toLowerCase()))){
							ret.add(recepti.get(i));
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<ReceptZaglavlje> rtrn = removeDuplicates(ret);
		return rtrn;
	}
	 private ArrayList<ReceptZaglavlje> removeDuplicates(ArrayList<ReceptZaglavlje> list) {
	        ArrayList<ReceptZaglavlje> result = new ArrayList<>();
	        HashSet<ReceptZaglavlje> set = new HashSet<>();
	        for (ReceptZaglavlje item : list) {
	            if (!set.contains(item)) {
	                result.add(item);
	                set.add(item);
	            }
	        }
	        return result;
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
	
	public List<ReceptZaglavlje> vrniMojiRecepti(int id_uporabnik) throws Exception {
		
		List<ReceptZaglavlje> ret = new ArrayList<ReceptZaglavlje>();
			
			Connection conn=null;
			try {
				conn=baza.getConnection();
				PreparedStatement ps = conn.prepareStatement("select * from ReceptZaglavlje where tk_uporabnik=?");
				ps.setInt(1, id_uporabnik);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					ReceptZaglavlje rz =new ReceptZaglavlje(rs.getInt("id_receptzaglavlje"),rs.getString("naziv"), rs.getString("slika"),rs.getString("kratekOpis"));
					ret.add(rz);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
			}
			return ret;
		}
}
		
	
	


