package com.school.library.enums;

public enum BookUserStatusEnum {
	
	BORROWED("BORROWED",  "BORROWED"),
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
