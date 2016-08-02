package tr.com.thirtytwobit.personApp.resources;

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
			System.out.println(gson.toJson(personData));
			persons = gson.toJson(personData);

		} catch (Exception e) {
			System.out.println("error" + e.getMessage());
		}
		return persons;
	}

	/// BURALAR YEŞİLLENECEK
	// TO-DO
	@POST
	public Person addPerson(Person person) {
		return personservice.addPerson(person);
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
