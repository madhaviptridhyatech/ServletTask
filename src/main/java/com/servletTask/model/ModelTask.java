package com.servletTask.model;

import java.sql.Date;

public class ModelTask {
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private long phoneNumber;
	private String genderRadios;
	private String languageCheck;
	private Date dateOfBirth;
	private String education;
	private String address;
	private String city;
	private String state;
	private int zipCode;
	private String password;
	private String role;
	
	public ModelTask() {
		super();
	}

	public ModelTask(int id, String firstName, String lastName, String email, long phoneNumber, String genderRadios,
			String languageCheck, Date dateOfBirth, String education, String address, String city, String state,
			int zipCode, String password) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.genderRadios = genderRadios;
		this.languageCheck = languageCheck;
		this.dateOfBirth = dateOfBirth;
		this.education = education;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.password = password;
	}

	public ModelTask(String firstName, String lastName, String email, long phoneNumber, String genderRadios,
			String languageCheck, Date dateOfBirth, String education, String address, String city, String state,
			int zipCode, String password) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.genderRadios = genderRadios;
		this.languageCheck = languageCheck;
		this.dateOfBirth = dateOfBirth;
		this.education = education;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.password = password;
	}

	public ModelTask(int id, String firstName, String lastName, String email, long phoneNumber, String genderRadios,
			String languageCheck, Date dateOfBirth, String education, String address, String city, String state,
			int zipCode) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.genderRadios = genderRadios;
		this.languageCheck = languageCheck;
		this.dateOfBirth = dateOfBirth;
		this.education = education;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
	}

	public ModelTask(String firstName, String lastName, String email, long phoneNumber, String genderRadios,
			String languageCheck, Date dateOfBirth, String education, String address, String city, String state,
			int zipCode) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.genderRadios = genderRadios;
		this.languageCheck = languageCheck;
		this.dateOfBirth = dateOfBirth;
		this.education = education;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
	}

	public ModelTask(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getGenderRadios() {
		return genderRadios;
	}

	public void setGenderRadios(String genderRadios) {
		this.genderRadios = genderRadios;
	}

	public String getLanguageCheck() {
		return languageCheck;
	}

	public void setLanguageCheck(String languageCheck) {
		this.languageCheck = languageCheck;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
