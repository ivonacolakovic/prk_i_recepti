package si.um.feri.praktikum.dao;


import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import si.um.feri.praktikum.razredi.Uporabniki;


public class UporabnikiDAO {
	DataSource baza;
	
	public UporabnikiDAO() {
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
			conn.createStatement().execute("CREATE TABLE IF NOT EXISTS uporabniki(id_uporabniki int not null auto_increment primary key, ime varchar(100) not null,priimek varchar(100) not null,email varchar(100) not null, uporabniskoIme varchar(100) not null, geslo varchar(100) not null)");
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
			conn.createStatement().execute("DROP TABLE IF EXISTS uporabniki CASCADE");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}
	
	public void shrani(Uporabniki r) throws SQLException {
		Connection conn=null;
		//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		// String datum = sdf.format(r.getCasObjave());
		try {
			conn=baza.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT into uporabniki(ime, priimek, email, uporabniskoIme, geslo) values(?, ?, ?, ?, ?)");
		
			ps.setString(1, r.getIme());
			ps.setString(2, r.getPriimek());
			ps.setString(3, r.getEmail());
			ps.setString(4, r.getUporabniskoIme());
			ps.setString(5, r.getGeslo());
			
			
			ps.executeUpdate();
			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn.close();
			}
		}
	
	public List<Uporabniki> vrniVse() throws Exception {
		
		List<Uporabniki> ret = new ArrayList<Uporabniki>();
			
			Connection conn=null;
			try {
				conn=baza.getConnection();
				
	
				ResultSet rs=conn.createStatement().executeQuery("select * from Uporabniki order by ime");
				while (rs.next()) {
					Uporabniki rz =new Uporabniki(rs.getInt("id_uporabniki"),rs.getString("ime"), rs.getString("priimek"),rs.getString("email"), rs.getString("uporabniskoIme"), rs.getString("geslo"));
	
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
	
		
	public void izbrisiUporabnika(int id) throws Exception{
		Connection conn=null;
		try{
			conn=baza.getConnection();
	
			
			PreparedStatement ps = conn.prepareStatement("DELETE from uporabniki where ID_uporabniki=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			
		}
		finally{
			conn.close();
		}	
	}
	public void urediUporabnika(String ime, String priimek, String email, String uporabniskoIme, String geslo, int id) throws Exception{
		Connection conn=null;
		try{
			conn=baza.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("UPDATE uporabniki SET IME=?, PRIIMEK=?, EMAIL=?, uporabniskoIme=?, GESLO=? WHERE ID_uporabniki=?");
			ps.setString(1, ime);
			ps.setString(2, priimek);
			ps.setString(3, email);
			ps.setString(4, uporabniskoIme);
			ps.setString(5, geslo);
			ps.setInt(6,id);
			
			ps.executeUpdate();
		}
		finally{
			conn.close();
		}	
	}
	public void urediGeslo(String geslo, int id) throws Exception{
		Connection conn=null;
		try{
			conn=baza.getConnection();
			
			PreparedStatement ps = conn.prepareStatement("UPDATE uporabniki GESLO=? WHERE ID_uporabniki=?");
			ps.setString(1, geslo);
			ps.setInt(2,id);
			
			ps.executeUpdate();
		}
		finally{
			conn.close();
		}	
	}
	public int vrniIdUporabnika(String uporabniskoIme,String geslo) throws Exception{
		Connection conn=null;
		int id = 0;
		try{
			conn=((java.sql.Statement) baza).getConnection();
			
		
			PreparedStatement ps = conn.prepareStatement("SELECT ID_uporabniki from uporabniki WHERE uporabniskoIME=? and geslo=?");
			ps.setString(1, uporabniskoIme);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				id = rs.getInt("ID_uporabniki");
			}

			rs.close();
		}
		finally{
			conn.close();
		}
		return id;
	}
	
	public Uporabniki najdi(String ime, String geslo) throws SQLException {
		Connection conn = null;
		Uporabniki rz = new Uporabniki();
		try {
			conn = baza.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from uporabniki where uporabniskoime=? and geslo=?");
			ps.setString(1, ime);
			ps.setString(2, geslo);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){			
				
				rz =new Uporabniki(rs.getInt("id_uporabniki"),rs.getString("ime"), rs.getString("priimek"),rs.getString("email"), rs.getString("uporabniskoIme"), rs.getString("geslo"));
			}
		}
			finally{
				conn.close();
			}
		return rz;
			
		
	}
	
}

			