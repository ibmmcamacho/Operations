package com.pe.ibm.bean;

public class BeanInformix extends BeanOperacion{
	
	private String sessionId = "";
	private String sessionSeqNum = "";
	private String nodeID = "";
	private String profileID = "";
	private String applicationname = "";
	private String contactType = "";
	private String contactDisposition = "";
	private String startDateTime = "";
	private String endDateTime = "";
	private String minute = "";
	private String current = "";
	
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getSessionSeqNum() {
		return sessionSeqNum;
	}
	public void setSessionSeqNum(String sessionSeqNum) {
		this.sessionSeqNum = sessionSeqNum;
	}
	public String getNodeID() {
		return nodeID;
	}
	public void setNodeID(String nodeID) {
		this.nodeID = nodeID;
	}
	public String getProfileID() {
		return profileID;
	}
	public void setProfileID(String profileID) {
		this.profileID = profileID;
	}
	public String getApplicationname() {
		return applicationname;
	}
	public void setApplicationname(String applicationname) {
		this.applicationname = applicationname;
	}
	public String getContactType() {
		return contactType;
	}
	public void setContactType(String contactType) {
		this.contactType = contactType;
	}
	public String getContactDisposition() {
		return contactDisposition;
	}
	public void setContactDisposition(String contactDisposition) {
		this.contactDisposition = contactDisposition;
	}
	public String getStartDateTime() {
		return startDateTime;
	}
	public void setStartDateTime(String startDateTime) {
		this.startDateTime = startDateTime;
	}
	public String getEndDateTime() {
		return endDateTime;
	}
	public void setEndDateTime(String endDateTime) {
		this.endDateTime = endDateTime;
	}
	public String getMinute() {
		return minute;
	}
	public void setMinute(String minute) {
		this.minute = minute;
	}
	public String getCurrent() {
		return current;
	}
	public void setCurrent(String current) {
		this.current = current;
	}
	
}

