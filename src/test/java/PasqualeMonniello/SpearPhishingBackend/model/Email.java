package PasqualeMonniello.SpearPhishingBackend.model;

import java.io.Serializable;

import javax.persistence.*;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="emails")
@EntityListeners(AuditingEntityListener.class)
public class Email implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column
	private String f_email;
	
	@Column(nullable=false)
	private String subj;
	
	@Column(nullable=false)
	private String FK_target;
	
	@Column(nullable=false)
	private String content;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFK_target() {
		return FK_target;
	}

	public void setFK_target(String fK_target) {
		FK_target = fK_target;
	}

	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getf_email() {
		return f_email;
	}

	public void setf_email(String f_email) {
		this.f_email = f_email;
	}

	public String getSubj() {
		return subj;
	}

	public void setSubj(String subj) {
		this.subj = subj;
	}

	@Override
	public String toString() {
		return "Email [id=" + id + ", subj=" + subj + ", FK_target=" + FK_target + ", content=" + content + "]";
	}


	
	
}
