Feature: Hear shout

    Shouty allows users to "hear" other users "shouts" as long as they are close enough to each other.
    You can write a description in here, as long as it doesn't use Cucumber keywords.

    Rule: Shouts can only be heard by other users
        Scenario: Listener is within range
            Given a person named Lucy
            And a person named Sean
            When Sean shouts "Free bagels at Sean's"
            Then Lucy hears Sean's message
        
        Scenario: Listener hears a different message
            Given a person named Lucy
            And a person named Sean
            When Sean shouts "Free coffee at Sean's"
            Then Lucy hears Sean's message

    Rule: Shouts can only be heard by other users
        Scenario: Listener is within range
        Scenario: Listener is out of range