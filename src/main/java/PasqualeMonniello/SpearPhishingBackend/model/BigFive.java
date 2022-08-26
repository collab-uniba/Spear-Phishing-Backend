package PasqualeMonniello.SpearPhishingBackend.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="bigfive")
@EntityListeners(AuditingEntityListener.class)
public class BigFive implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="u_email")
	private String u_email;
	
	@Column(name="extraversion")
	private int extraversion;
	
	@Column(name="agreebleness")
	private int agreebleness;
	
	@Column(name="imagination")
	private int imagination;
	
	@Column(name="nevroticism")
	private int nevroticism;
	
	@Column(name="consciousness")
	private int consciousness;

	@Override
	public String toString() {
		return "BigFive [u_email=" + u_email + ", extraversion=" + extraversion + ", agreebleness=" + agreebleness
				+ ", imagination=" + imagination + ", nevroticism=" + nevroticism + ", consciousness=" + consciousness
				+ "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(u_email);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BigFive other = (BigFive) obj;
		return Objects.equals(u_email, other.u_email);
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public int getExtraversion() {
		return extraversion;
	}

	public void setExtraversion(int extraversion) {
		this.extraversion = extraversion;
	}

	public int getAgreebleness() {
		return agreebleness;
	}

	public void setAgreebleness(int agreebleness) {
		this.agreebleness = agreebleness;
	}

	public int getImagination() {
		return imagination;
	}

	public void setImagination(int imagination) {
		this.imagination = imagination;
	}

	public int getNevroticism() {
		return nevroticism;
	}

	public void setNevroticism(int nevroticism) {
		this.nevroticism = nevroticism;
	}

	public int getConsciousness() {
		return consciousness;
	}

	public void setConsciousness(int consciousness) {
		this.consciousness = consciousness;
	}
	
	
}
