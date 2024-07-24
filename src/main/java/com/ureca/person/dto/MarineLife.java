package com.ureca.person.dto;

import java.sql.Date;

public class MarineLife {
	private int no;
    private String name;
    private String type;
    private Date admissionDate;
    private int birthYear;
    private String gender;
    private String injuryType;
    private String injuryContent;
    private String notes;
    
    public MarineLife() {
		// TODO Auto-generated constructor stub
	}

	public MarineLife(int no, String name, String type, Date admissionDate, int birthYear, String gender, String injuryType,
			String injuryContent, String notes) {
		this.no = no;
		this.name = name;
		this.type = type;
		this.admissionDate = admissionDate;
		this.birthYear = birthYear;
		this.gender = gender;
		this.injuryType = injuryType;
		this.injuryContent = injuryContent;
		this.notes = notes;
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

	public int getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(int birthYear) {
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

	@Override
	public String toString() {
		return "Person [no=" + no + ", name=" + name + ", type=" + type + ", admissionDate=" + admissionDate
				+ ", birthYear=" + birthYear + ", gender=" + gender + ", injuryType=" + injuryType + ", injuryContent="
				+ injuryContent + ", notes=" + notes + "]";
	}

	
    
    
}