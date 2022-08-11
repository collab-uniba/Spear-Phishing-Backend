package PasqualeMonniello.SpearPhishingBackend.model;

import java.io.Serializable;

import javax.persistence.*;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="users")
@EntityListeners(AuditingEntityListener.class)
public class User implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	private String email;
	
	@Column(nullable=false)
	private String fname;
	
	@Column(nullable=false)
	private String lname;
	
	@Column
	private String position;
	
	@Column
	private String phonenumber;

	
	
	public User(String email, String fname, String lname, String position, String phonenumber) {
		super();
		this.email = email;
		this.fname = fname;
		this.lname = lname;
		this.position = position;
		this.phonenumber = phonenumber;
	}

	@Override
	public String toString() {
		return "Users [email=" + email + ", fname=" + fname + ", lname=" + lname + ", position=" + position
				+ ", phonenumber=" + phonenumber + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	
}
