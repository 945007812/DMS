package cn.edu.scu.dms.model;

import java.util.Date;

public class Qpwj {
  
	private String qpid;

	private Date qptime;

	private String title;

	private Date attribute;

	private String leadername;

	private String zpishi;

	private String direction;

	private String note;

	public String getQpid() {
		return qpid;
	}

	public void setQpid(String qpid) {
		this.qpid = qpid == null ? null : qpid.trim();
	}

	public Date getQptime() {
		return qptime;
	}

	public void setQptime(Date qptime) {
		this.qptime = qptime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public Date getAttribute() {
		return attribute;
	}

	public void setAttribute(Date attribute) {
		this.attribute = attribute;
	}

	public String getLeadername() {
		return leadername;
	}

	public void setLeadername(String leadername) {
		this.leadername = leadername == null ? null : leadername.trim();
	}

	public String getZpishi() {
		return zpishi;
	}

	public void setZpishi(String zpishi) {
		this.zpishi = zpishi == null ? null : zpishi.trim();
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction == null ? null : direction.trim();
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note == null ? null : note.trim();
	}

	
}