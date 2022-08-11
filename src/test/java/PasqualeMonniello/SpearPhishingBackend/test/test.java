package PasqualeMonniello.SpearPhishingBackend.test;

import java.io.File;
import java.io.FileNotFoundException;

import org.json.JSONException;
import org.json.JSONObject;
import org.simplejavamail.api.email.Email;
import org.simplejavamail.converter.EmailConverter;

import PasqualeMonniello.SpearPhishingBackend.Builders.JSONBuilder;

public class test {

	public static void main(String[] args) throws FileNotFoundException {
		File eml = new File("E:\\CodeProjects\\Eclipse\\SpearPhishingBackend\\src\\emails\\email.eml");
		Email email = EmailConverter.emlToEmail(eml);
		try {
			JSONObject obj = JSONBuilder.buildEmail(email);
			System.out.println(email.getRecipients().get(0).getAddress());
			System.out.println(obj.toString(2));
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
