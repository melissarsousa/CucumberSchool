Feature: Hear shout

    Shouty allows users to "hear" other users "shouts" as long as they are close enough to each other.
    You can write a description in here, as long as it doesn't use Cucumber keywords.

    Rule: Shouts can be heard by other users
        Scenario: Listener hears a message
            Given a person named Sean
            And a person named Lucy
            When Sean shouts "Free bagels at Sean's"
            Then Lucy should hear Sean's message

    Rule: Shouts should only be heard if listener is within range
        Scenario: Listener is within range
            Given the range is 100
            And people are located at
                | name | location |
                | Sean | 0 |
                | Lucy | 50 |
            When Sean shouts
            Then Lucy should hear a shout

        Scenario: Listener is out of range
            Given the range is 100
            And people are located at
                | name | location |
                | Sean | 0 |
                | Larry | 150 |
            When Sean shouts
            Then Larry should not hear a shout

    Rule: Listener should be able to hear multiple shouts
        Scenario: Two shouts
            Given a person named Sean
            And a person named Lucy
            When Sean shouts "Free bagels!"
            And Sean shouts "Free toast!"
            Then Lucy hears the following messages:
                |Free bagels!|
                |Free toast!|

    Rule: Maximun length of message is 180 characters
        Scenario: Message is too long
            Given a person named Sean
            And a person named Lucy
            When Sean shouts the following message
                """
                This is a really long message
                so long in fact that I am not going to
                be allowed to send it, at least if I keep
                typing like this until the length is over
                the limit of 180 characters.
                """
            Then Lucy shout not hear a shout