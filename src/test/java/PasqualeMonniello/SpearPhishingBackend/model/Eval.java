package PasqualeMonniello.SpearPhishingBackend.model;

import java.io.Serializable;

import javax.persistence.*;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="evals")
@EntityListeners(AuditingEntityListener.class)
@IdClass(EvalKey.class)
public class Eval implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(nullable=false)
	private String FK_varchar;
	
	@Id
	@Column(nullable=false)
	private int FK_id;
	
	private boolean isEvalPhish;

	public String getFK_varchar() {
		return FK_varchar;
	}

	public void setFK_varchar(String fK_varchar) {
		FK_varchar = fK_varchar;
	}

	public int getFK_id() {
		return FK_id;
	}

	public void setFK_id(int fK_id) {
		FK_id = fK_id;
	}

	public boolean isEvalPhish() {
		return isEvalPhish;
	}

	public void setEvalPhish(boolean isEvalPhish) {
		this.isEvalPhish = isEvalPhish;
	}
	
	
	
}
