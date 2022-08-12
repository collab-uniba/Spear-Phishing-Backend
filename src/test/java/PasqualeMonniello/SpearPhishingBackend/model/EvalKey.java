package PasqualeMonniello.SpearPhishingBackend.model;

import javax.persistence.IdClass;

import java.io.Serializable;

import javax.persistence.Id;

public class EvalKey implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3275658633527386733L;
	@Id
	private String FK_email;
	@Id
	private int FK_id;
	
	public EvalKey(String fK_varchar, int fK_id) {
		super();
		FK_email = fK_varchar;
		FK_id = fK_id;
	}
	
	public EvalKey(String fK_varchar, long fK_id) {
		super();
		FK_email = fK_varchar;
		FK_id = (int) fK_id;
	}
	public String getFK_email() {
		return FK_email;
	}
	public void setFK_email(String FK_email) {
		this.FK_email = FK_email;
	}
	public int getFK_id() {
		return FK_id;
	}
	public void setFK_id(int fK_id) {
		FK_id = fK_id;
	}
	
	
}
