package PasqualeMonniello.SpearPhishingBackend.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.*;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="evals")
@EntityListeners(AuditingEntityListener.class)
public class Eval implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable=false)
	private String FK_email;

	@Column(nullable=false)
	private int FK_id;
	
	@Column(name="is_eval_phish")
	private boolean is_eval_phish;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public boolean isEvalPhish() {
		return is_eval_phish;
	}

	public void setEvalPhish(boolean is_eval_phish) {
		this.is_eval_phish = is_eval_phish;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Eval other = (Eval) obj;
		return id == other.id;
	}
		
}
