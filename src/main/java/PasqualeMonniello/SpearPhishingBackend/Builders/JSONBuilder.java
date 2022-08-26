package PasqualeMonniello.SpearPhishingBackend.Builders;

import org.json.JSONException;
import org.json.JSONObject;
import org.simplejavamail.api.email.Email;

public class JSONBuilder {
	
	public static JSONObject buildEmail(Email email) throws JSONException {
		JSONObject jsonEmail = new JSONObject();
		
		jsonEmail.put("from", email.getFromRecipient());
		jsonEmail.put("to", email.getRecipients().get(0).getAddress());
		jsonEmail.put("subject", email.getSubject());
		jsonEmail.put("html", email.getHTMLText());
		//jsonEmail.put("attachments", email.getAttachments());
		
		return jsonEmail;
	}
	
}
