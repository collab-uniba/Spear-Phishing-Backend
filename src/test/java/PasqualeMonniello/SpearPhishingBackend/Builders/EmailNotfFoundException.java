package PasqualeMonniello.SpearPhishingBackend.Builders;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class EmailNotfFoundException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8380842507969107469L;

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return "Email not found";
	}

	
	
}
