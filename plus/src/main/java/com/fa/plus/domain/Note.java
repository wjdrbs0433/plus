package com.fa.plus.domain;

import java.util.List;

public class Note {
	private long noteNum;
	private String content;
	private String senderId;
	private long senderIdx;
	private String senderName;
	private String receiverId;
	private long receiverIdx;
	private String receiverName;
	private String sendDate;
	private String identifyDate;
	private String sendDelete;
	private String receiveDelete;

	private List<Long> receivers;
	private String userId;
	private long memberIdx;
	private String userName;
	public long getNoteNum() {
		return noteNum;
	}
	public void setNoteNum(long noteNum) {
		this.noteNum = noteNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public long getSenderIdx() {
		return senderIdx;
	}
	public void setSenderIdx(long senderIdx) {
		this.senderIdx = senderIdx;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public long getReceiverIdx() {
		return receiverIdx;
	}
	public void setReceiverIdx(long receiverIdx) {
		this.receiverIdx = receiverIdx;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getIdentifyDate() {
		return identifyDate;
	}
	public void setIdentifyDate(String identifyDate) {
		this.identifyDate = identifyDate;
	}
	public String getSendDelete() {
		return sendDelete;
	}
	public void setSendDelete(String sendDelete) {
		this.sendDelete = sendDelete;
	}
	public String getReceiveDelete() {
		return receiveDelete;
	}
	public void setReceiveDelete(String receiveDelete) {
		this.receiveDelete = receiveDelete;
	}
	public List<Long> getReceivers() {
		return receivers;
	}
	public void setReceivers(List<Long> receivers) {
		this.receivers = receivers;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
}
