package com.ureca.marine.dto;

import java.util.Date;



public class MarineLife {
	private int no;
    private String name;
    private String type;
    private Date admissionDate;
    private Integer birthYear;
    private String gender;
    private String injuryType;
    private String injuryContent;
    private String notes;
    private Date injuryDate;
    private Date recoveryDate;
    private long daysSinceAdmission;
    private int age;
    private int daysUntilRecovery;
    
    public MarineLife() {
		
	}

	public MarineLife(int no, String name, String type, Date admissionDate, Integer birthYear, String gender, String injuryType,
			String injuryContent, String notes, Date injuryDate, Date recoveryDate) {
		this.no = no;
		this.name = name;
		this.type = type;
		this.admissionDate = admissionDate;
		this.birthYear = birthYear;
		this.gender = gender;
		this.injuryType = injuryType;
		this.injuryContent = injuryContent;
		this.notes = notes;
		this.injuryDate = injuryDate;
		this.recoveryDate = recoveryDate;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getAdmissionDate() {
		return admissionDate;
	}

	public void setAdmissionDate(Date admissionDate) {
		this.admissionDate = admissionDate;
	}

	public Integer getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(Integer birthYear) {
		this.birthYear = birthYear;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getInjuryType() {
		return injuryType;
	}

	public void setInjuryType(String injuryType) {
		this.injuryType = injuryType;
	}
	public Date getInjuryDate() {
		return injuryDate;
	}
	
	public void setInjuryDate(Date injuryDate) {
		this.injuryDate = injuryDate;
	}
	
	public Date getRecoveryDate() {
		return recoveryDate;
	}
	
	public void setRecoveryDate(Date recoveryDate) {
		this.recoveryDate = recoveryDate;
	}

	public String getInjuryContent() {
		return injuryContent;
	}

	public void setInjuryContent(String injuryContent) {
		this.injuryContent = injuryContent;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
	
	public long getDaysSinceAdmission() {
        return daysSinceAdmission;
    }

    public void setDaysSinceAdmission(long daysSinceAdmission) {
        this.daysSinceAdmission = daysSinceAdmission;
    }
    
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    public int getDaysUntilRecovery() {
        return daysUntilRecovery;
    }

    public void setDaysUntilRecovery(int daysUntilRecovery) {
        this.daysUntilRecovery = daysUntilRecovery;
    }

	@Override
	public String toString() {
		return "MarineLife [no=" + no + ", name=" + name + ", type=" + type + ", admissionDate=" + admissionDate
				+ ", birthYear=" + birthYear + ", gender=" + gender + ", injuryType=" + injuryType + ", injuryContent="
				+ injuryContent + ", notes=" + notes + ", injuryDate=" + injuryDate + ", recoveryDate=" + recoveryDate
				+ "]";
	}

	

	
    
    
}