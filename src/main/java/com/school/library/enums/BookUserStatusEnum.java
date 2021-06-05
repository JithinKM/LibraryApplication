package com.school.library.enums;

public enum BookUserStatusEnum {
	
	//Book Not yet With User
	REQUESTED("REQUESTED",  "Requested"),
	CANCELLED("CANCELLED",  "Cancelled"),
	DECLINED("DECLINED",  "Declined"),
	
	//Book Is With User
	ALLOTED("ALLOTED",  "Alloted"),
	RENEWREQUESTED("RENEWREQUESTED",  "Renew Requested"),
	RENEWDECLINED("RENEWDECLINED",  "Renew Declined"),
	
	//Book Is returned to Library
	RETURNED("RETURNED",  "Returned");
	
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
