package com.school.library.enums;

public enum BookUserStatusEnum {
	
	REQUESTED("REQUESTED",  "Requested"),
	ALLOTED("ALLOTED",  "Alloted"),
	DECLINED("DECLINED",  "Declined"),
	RENEWREQUESTED("RENEWREQUESTED",  "Renew Requested"),
	RENEWDECLINED("RENEWDECLINED",  "Renew Declined"),
	RETURNED("RETURNED",  "RETURNED");
	
	private final String status;
    private final String statusString;
    
	private BookUserStatusEnum(String status, String statusString) {
		this.status = status;
		this.statusString = statusString;
	}

	public String getStatus() {
		return status;
	}

	public String getStatusString() {
		return statusString;
	}
    
}
