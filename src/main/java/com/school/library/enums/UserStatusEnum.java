package com.school.library.enums;

public enum UserStatusEnum {
	
	PENDING("PENDIG",  "Pending Approval"),
	ACTIVE("ACTIVE",  "Active"),
	BLOCKED("BLOCKED",  "Blocked");
	
	private final String status;
    private final String statusString;
    
	private UserStatusEnum(String status, String statusString) {
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
