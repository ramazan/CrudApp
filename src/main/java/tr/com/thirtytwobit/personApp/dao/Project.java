package tr.com.thirtytwobit.personApp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import tr.com.thirtytwobit.personApp.model.Person;

public class Project {

	public ArrayList<Person> getPersons(Connection connection) throws Exception {
		ArrayList<Person> personData = new ArrayList<Person>();
		try {
			// String uname = request.getParameter("uname");
			PreparedStatement ps = connection.prepareStatement("SELECT id,tckn,name,lastname,adress FROM person");
			// ps.setString(1,uname);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Person personObject = new Person();
				personObject.setId(Integer.valueOf(rs.getString("id")));
				personObject.setTckn(rs.getString("tckn"));
				personObject.setFirstname(rs.getString("name"));
				personObject.setSurname(rs.getString("lastname"));
				personObject.setAdress(rs.getString("adress"));
				personData.add(personObject);
			}
			return personData;
		} catch (Exception e) {
			throw e;
		}
	}

}
