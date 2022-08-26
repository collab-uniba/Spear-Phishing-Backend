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
		String str= "diocane_bastardo_P.eml";
		String a = str.replaceAll("(_P\\.eml)$", "DIOCANE");
		System.out.println(a);
		System.out.println(str.matches(".*(_P\\.eml)$"));

	}

}
