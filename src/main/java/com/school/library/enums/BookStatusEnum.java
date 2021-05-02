package com.school.library.enums;

public enum BookStatusEnum {
	
	AVAILABLE("AVAILABLE",  "Available"),
	NOTAVAILABLE("NOTAVAILABLE",  "Not Available");
	
	private final String status;
    private final String statusString;
    
	private BookStatusEnum(String status, String statusString) {
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
