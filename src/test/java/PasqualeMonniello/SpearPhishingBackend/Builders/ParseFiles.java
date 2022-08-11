package PasqualeMonniello.SpearPhishingBackend.Builders;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.JSONException;
import org.json.JSONObject;
import org.simplejavamail.api.email.Email;
import org.simplejavamail.converter.EmailConverter;

public class ParseFiles {
	
	public static void main(String[] args) throws FileNotFoundException {
		File folder = new File("E:\\\\CodeProjects\\\\Eclipse\\\\SpearPhishingBackend\\\\src\\\\emails");
		File[] listOfFiles = folder.listFiles();
		
		for(File f : listOfFiles) {
			if(f.isFile()) {
				Email email = EmailConverter.emlToEmail(f);
				uploadEmail(email);
			}
		}
	}
	
	
	public static void uploadEmail(Email em) {
		try {
			//registra il driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			//esegue la connessione
			
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/spearphishing","root","admin");
			System.out.println("Connessione effettuata");
			
			//creaimo l'ambiente per eseguire le query
			
			
			String query  = "insert into emails (FK_target, content) values(?,?)";
			
			JSONObject json = JSONBuilder.buildEmail(em);
			
			
			
			PreparedStatement preparestmt = con.prepareStatement(query);
			
			preparestmt.setString(1, em.getRecipients().get(0).getAddress());
			preparestmt.setString(2,json.toString());
			
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