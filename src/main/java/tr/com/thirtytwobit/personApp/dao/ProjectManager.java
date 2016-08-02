package tr.com.thirtytwobit.personApp.dao;

import java.sql.Connection;
import java.util.ArrayList;

import tr.com.thirtytwobit.personApp.model.Person;


public class ProjectManager {
	
	
	public ArrayList<Person> getPersons()throws Exception {
		ArrayList<Person> persons = null;
		try {
			    Database database= new Database();
			    Connection connection = database.Get_Connection();
				Project project= new Project();
				persons=project.getPersons(connection);
		
		} catch (Exception e) {
			throw e;
		}
		return persons;
	}

}
