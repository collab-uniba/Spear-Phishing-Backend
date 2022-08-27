package PasqualeMonniello.SpearPhishingBackend.Builders;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.simplejavamail.api.email.Email;
import org.simplejavamail.converter.EmailConverter;

import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import PasqualeMonniello.SpearPhishingBackend.model.User;

public class ParseFiles {
	
	public static String USERSPATH = "src/users/";
	public static String EMAILPATH = "src/emails/final";

	
	public static void main(String[] args) throws FileNotFoundException {
		UploadAll();
	}
	
	public static void UploadAll() {
		List<User> users = getUsersFromCSV();
		for(User u : users) {
			uploadUser(u);
			File[] ems = getFilesByEmail(EMAILPATH);
			for(File f : ems) {
				Email e = EmailConverter.emlToEmail(f);
				uploadEmail(e, u.getEmail(), isEmailPhishing(f), u);
			}
		}
	}
	
	public static File[] getFilesByEmail(String path){
		File folder = new File(path);
		File[] list = folder.listFiles();
		
		return list;
	}
	
	public static List<User> getUsersFromCSV(){
		List<User> list = new ArrayList<User>();
		try {
			File csv = new File(USERSPATH+"usersbatch.csv");
			FileReader filereader = new FileReader(csv);
			CSVReader csvReader = new CSVReaderBuilder(filereader)
                    .withSkipLines(1)
                    .build();
			List<String[]> allData = csvReader.readAll();
			System.out.println("Loading users...");
	        // print Data
	        for (String[] row : allData) {
	        	System.out.println(row[0]);
	        	//System.out.println(row[0]+","+row[1]+","+row[2]+","+row[3]+","+row[4]);
	            list.add(new User(row[0],row[1],row[2],row[3],row[4]));
	        }
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public static boolean isEmailPhishing(File f) {
		System.out.println(f.getName());
		return f.getName().matches(".*(_P\\.eml)$");
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
			
			System.out.println(System.lineSeparator()+"Uploading user: " +u);
			
			preparestmt.setString(1, u.getEmail());
			preparestmt.setString(2,u.getFname());
			preparestmt.setString(3,u.getLname());
			preparestmt.setString(4,u.getPosition());
			preparestmt.setString(5,u.getPhonenumber());
			
			preparestmt.executeUpdate();
			
			System.out.println(System.lineSeparator()+"Uploading complete");

			preparestmt.close();
			con.close();

			//eseguiamo la query
		
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void uploadEmail(Email em, String target, Boolean phish, User u) {
		try {
			//registra il driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			//esegue la connessione
			
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/spearphishing","root","admin");
			System.out.println("Connessione effettuata");
			
			//creaimo l'ambiente per eseguire le query
			
			
			String query  = "insert into emails (f_email, subj, FK_target, content, isPhish) values(?,?,?,?,?)";
			
			JSONObject json = JSONBuilder.buildEmail(em);
			
			PreparedStatement preparestmt = con.prepareStatement(query);
			
			String subj = replaceWithUser(em.getSubject(), u);
			
			String emailContent = replaceWithUser(json.get("html").toString(), u);
			
			System.out.println("Uploading email: " + subj +"; For: " + target);
			
			preparestmt.setString(1, em.getFromRecipient().getAddress());
			preparestmt.setString(2, subj);
			preparestmt.setString(3, target);
			preparestmt.setString(4,emailContent);
			preparestmt.setBoolean(5, phish);
			
			preparestmt.executeUpdate();
			
			System.out.println(System.lineSeparator()+"Uploading complete");
			
			preparestmt.close();
			con.close();

			//eseguiamo la query
		
		} catch (ClassNotFoundException | SQLException | JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static String replaceWithUser(String string, User u) {
		String temp = string.replaceAll("\\(EMAIL\\)", u.getEmail());
		temp = temp.replaceAll("\\(FNAME\\)", u.getFname());
		temp = temp.replaceAll("\\(LNAME\\)", u.getLname());
		temp = temp.replaceAll("\\(POS\\)", u.getPosition());
		return temp;

	}
	
}