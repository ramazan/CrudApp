package tr.com.thirtytwobit.personApp.resources;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;

import tr.com.thirtytwobit.personApp.dao.Database;
import tr.com.thirtytwobit.personApp.dao.ProjectManager;
import tr.com.thirtytwobit.personApp.model.Person;
import tr.com.thirtytwobit.personApp.service.PersonService;

@Path("/persons")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class PersonController {

	PersonService personservice = new PersonService();

	@GET
	public String getPersons() {

		String persons = null;
		try {
			ArrayList<Person> personData = null;
			ProjectManager projectManager = new ProjectManager();
			personData = projectManager.getPersonsConnections();
			// StringBuffer sb = new StringBuffer();
			Gson gson = new Gson();
//			System.out.println(gson.toJson(personData));
			persons = gson.toJson(personData);

		} catch (Exception e) {
			System.out.println("error" + e.getMessage());
		}
		return persons;
	}

	/// BURALAR YEŞİLLENECEK
	// TO-DO
	@POST
	public void addPerson(Person person) throws Exception {
		System.out.println("Tckn : " + person.getTckn() + "  \n ad  : " + person.getFirstname() + "\n  soyad: "
				+ person.getSurname() + "\n adres : " + person.getAdress());

		Database database = new Database();
		Connection connection = database.Get_Connection();

		Statement stmt = connection.createStatement();
		connection.setAutoCommit(false);

		String sql = "INSERT INTO person (tckn,name,lastname,adress) " + "VALUES ('" + person.getTckn() + "','"
				+ person.getFirstname() + "' ,'" + person.getSurname() + "' ,'" + person.getAdress() + "');";

		stmt.execute(sql);

		stmt.close();
		connection.commit();
		connection.close();

	}

	@PUT
	public Person updatePerson(Person person) {
		return personservice.updatePerson(person);

	}

	@DELETE
	@Path("/{id}")
	public void deleteCountry(@PathParam("id") int id) {

		personservice.deletePerson(id);
	}

}
