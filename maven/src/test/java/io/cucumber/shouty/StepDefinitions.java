package io.cucumber.shouty;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;
import java.util.HashMap;

import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class StepDefinitions {

    private Person sean;
    private Person lucy;
    private String messageFromSean;
    private Network network;
    private HashMap<String, Person> people;

    @Before
    public void createNetwork(){
        network = new Network();
        people = new HashMap<>();
    }

    @Given("a person named {name}")
    public void a_person_named_Lucy(String name){
        people.put(name, new Person(network));
    }

    @When("Sean shouts {string}")
    public void sean_shouts(String message) {
        sean.shout(message);
        messageFromSean = message;
    }

    @Then("Lucy hears Sean's message")
    public void lucy_hears_sean_s_message() {
        assertEquals(Arrays.asList(messageFromSean), lucy.getMessagesHeard());
    }

}
