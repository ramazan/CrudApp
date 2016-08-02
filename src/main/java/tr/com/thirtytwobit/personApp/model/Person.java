package tr.com.thirtytwobit.personApp.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Person {

	private int id;
	private String tckn;
	private String firstname;
	private String surname;
	private String adress;

	public Person() {

	}

	public Person(int id,String tckn, String firstname, String surname, String adress) {
		this.id=id;
		this.tckn = tckn;
		this.firstname = firstname;
		this.surname = surname;
		this.adress = adress;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTckn() {
		return tckn;
	}

	public void setTckn(String tckn) {
		this.tckn = tckn;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

}