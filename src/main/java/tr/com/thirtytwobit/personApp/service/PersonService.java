package tr.com.thirtytwobit.personApp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tr.com.thirtytwobit.personApp.model.Person;


///SUAN KULLANILMIYOR


public class PersonService {

	private static Map<Integer, Person> persons = new HashMap<>();

	public PersonService() {

		persons.put(1, new Person(1, "19876543203", "Ramazan", "Demir", "Kocaeli"));
		persons.put(2, new Person(2, "23240102312", "Ali", "Veli", "İstanbul"));

	}

	public List<Person> getAllPersons() {
		List<Person> personList = new ArrayList<Person>(persons.values());
		return personList;
	}

	public Person getPerson(int id) {
		Person person = persons.get(id);
		return person;
	}

	public Person addPerson(Person person) {
		person.setId(persons.size() + 1);
		persons.put(person.getId(), person);
		return person;
	}

	public Person updatePerson(Person person) {
		if (person.getId() <= 0)
			return null;
		persons.put(person.getId(), person);
		return person;

	}

	public void deletePerson(int id) {
		persons.remove(id);
	}

}
