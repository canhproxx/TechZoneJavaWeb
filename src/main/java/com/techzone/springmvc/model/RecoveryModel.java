package com.techzone.springmvc.model;


/** MODEL **/
public class RecoveryModel {
	
	private String emailRecovery;
	
	public RecoveryModel() {
		
	}

	public RecoveryModel(String emailRecovery) {
		this.emailRecovery = emailRecovery;
	}

	public String getEmailRecovery() {
		return emailRecovery;
	}

	public void setEmailRecovery(String emailRecovery) {
		this.emailRecovery = emailRecovery;
	}

}
