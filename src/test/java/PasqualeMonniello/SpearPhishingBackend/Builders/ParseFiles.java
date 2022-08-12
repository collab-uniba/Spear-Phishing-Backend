package PasqualeMonniello.SpearPhishingBackend.Builders;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.simplejavamail.api.email.Email;
import org.simplejavamail.converter.EmailConverter;

import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import PasqualeMonniello.SpearPhishingBackend.model.User;

public class ParseFiles {
	
	public static String PATH = "E:\\\\CodeProjects\\\\Eclipse\\\\SpearPhishingBackend\\\\src\\\\emails\\";
	
	public static void main(String[] args) throws FileNotFoundException {
		
	}
	
	public static File[] getFilesByEmail(String email){
		File folder = new File(PATH+email);
		File[] list = folder.listFiles();

		for(File f:list) {
			if(f.isFile()) {
				Email e = EmailConverter.emlToEmail(f);
				
				uploadEmail(e, email, isEmailPhishing(f));
			}
		}
		
		return list;
	}
	
	public static void parseCSV() {
		try {
			File csv = new File(PATH+"users.csv");
			FileReader filereader = new FileReader(csv);
			CSVReader csvReader = new CSVReaderBuilder(filereader)
                    .withSkipLines(1)
                    .build();
			List<String[]> allData = csvReader.readAll();
			  
	        // print Data
	        for (String[] row : allData) {
	            uploadUser(new User(row[0],row[1],row[2],row[3],row[4]));
	        }
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static boolean isEmailPhishing(File f) {
		return f.getName().toUpperCase().matches("_P$");
	}
	
	public static void uploadUser(User u) {
		try {
			//registra il driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			//esegue la connessione
			
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/spearphishing","root","admin");
			System.out.println("Connessione effettuata");
			
			//creaimo l'ambiente per eseguire le query
			
			
			String query  = "insert into users (email, fname, lname, position, phonenumber) values(?,?,?,?,?)";
					
			
			PreparedStatement preparestmt = con.prepareStatement(query);
			
			preparestmt.setString(1, u.getEmail());
			preparestmt.setString(2,u.getFname());
			preparestmt.setString(3,u.getLname());
			preparestmt.setString(4,u.getPosition());
			preparestmt.setString(5,u.getPhonenumber());
			
			preparestmt.executeUpdate();
			
			preparestmt.close();
			con.close();

			//eseguiamo la query
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void uploadEmail(Email em, String target, Boolean phish) {
		try {
			//registra il driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			//esegue la connessione
			
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/spearphishing","root","admin");
			System.out.println("Connessione effettuata");
			
			//creaimo l'ambiente per eseguire le query
			
			
			String query  = "insert into emails (subj, FK_target, content, isPhish) values(?,?,?,?)";
			
			JSONObject json = JSONBuilder.buildEmail(em);
			
			
			
			PreparedStatement preparestmt = con.prepareStatement(query);
			
			preparestmt.setString(1, em.getSubject());
			preparestmt.setString(2, target);
			preparestmt.setString(3,json.toString());
			preparestmt.setBoolean(4, phish);
			
			preparestmt.executeUpdate();
			
			preparestmt.close();
			con.close();

			//eseguiamo la query
		
		} catch (ClassNotFoundException | SQLException | JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}