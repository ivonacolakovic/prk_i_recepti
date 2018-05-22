package si.um.feri.praktikum.dao;


	
	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.SQLException;
	import java.text.SimpleDateFormat;

	import javax.naming.InitialContext;
	import javax.sql.DataSource;

	import si.um.feri.praktikum.razredi.Avtor;
import si.um.feri.praktikum.razredi.ReceptZaglavlje;

	public class AvtorDAO {
		DataSource baza;
		
		public AvtorDAO() {
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
				conn.createStatement().execute("CREATE TABLE IF NOT EXISTS AVTOR(id_avtor int not null auto_increment primary key, ime varchar(10) not null, tk_id_recept int not null)");
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
				conn.createStatement().execute("DROP TABLE IF EXISTS AVTOR CASCADE");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
			}
		}
		
		public void shrani(Avtor a,ReceptZaglavlje r) throws SQLException {
			Connection conn=null;
			try {
				conn=baza.getConnection();

					PreparedStatement ps = conn.prepareStatement("INSERT INTO AVTOR(ime,tk_recept_id) VALUES (?,?)");
					ps.setString(1, a.getIme());
					//ps.setInt(2, r.getId_recept());
					
					
					ps.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
			}
		}

}
