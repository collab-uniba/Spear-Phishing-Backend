package PasqualeMonniello.SpearPhishingBackend.model;

import javax.persistence.IdClass;
import javax.persistence.Id;

@IdClass(Eval.class)
public class EvalKey {
	@Id
	private String FK_varchar;
	@Id
	private int FK_id;
	
	public EvalKey(String fK_varchar, int fK_id) {
		super();
		FK_varchar = fK_varchar;
		FK_id = fK_id;
	}
	
	public EvalKey(String fK_varchar, long fK_id) {
		super();
		FK_varchar = fK_varchar;
		FK_id = (int) fK_id;
	}
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
	
	
}
