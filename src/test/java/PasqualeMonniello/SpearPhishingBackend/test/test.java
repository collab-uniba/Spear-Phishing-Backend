package PasqualeMonniello.SpearPhishingBackend.test;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.regex.Pattern;

import org.json.JSONException;
import org.json.JSONObject;
import org.simplejavamail.api.email.Email;
import org.simplejavamail.converter.EmailConverter;

import PasqualeMonniello.SpearPhishingBackend.Builders.JSONBuilder;
import PasqualeMonniello.SpearPhishingBackend.Builders.ParseFiles;

public class test {

	public static void main(String[] args) throws FileNotFoundException {
		File eml = new File("E:\\CodeProjects\\Eclipse\\SpearPhishingBackend\\src\\emails\\pasquale.monniello00@gmail.com\\email4.eml");
		
		//String str= "diocanedio ___EMAIL___ diocanediocane";
		//String a = str.replaceAll("((_)*EMAIL(_)*)", "DIOCANE");
		String str= "diocanedio ,(EMAIL), diocanediocane";
		String a = str.replaceAll("\\(EMAIL\\)", "DIOCANE");
		System.out.println(a);
		
		
		Email email = EmailConverter.emlToEmail(eml);
		
		try {
			JSONObject obj = JSONBuilder.buildEmail(email);
			//System.out.println(ParseFiles.replaceWithUser(obj.get("html").toString()));
			System.out.println(obj.get("html").toString());
			//System.out.println(email.getFromRecipient().getAddress());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
