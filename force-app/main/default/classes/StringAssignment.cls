public  class StringAssignment {
    public void LocalString(){
        string LocalString='Thanks for the session on the string';
        system.debug(LocalString);
        //•	Create a variable and find out the length of the Localstring variable and display the length.
        Integer lengthOfLocalString=LocalString.length();
        system.debug('Length of local string: '+lengthOfLocalString);


        //•	Create a variable and convert the Localstring variable to upper case and display the same.
        string capitalLocalString=LocalString.toUpperCase();
        system.debug('Local string is in Capital Letter: '+capitalLocalString);

        //•	Create a variable and check string “session” is present in Localstring variable or not.
        Boolean containsSession=LocalString.contains('session');
        system.debug('contains -session-? '+containsSession);

        //•	Create a variable and check string “sessions” is present in Localstring variable or not.
        Boolean containsSession2=LocalString.contains('sessions');
        system.debug('contains -session-? '+containsSession2);

        //•	Create a variable and check if “SESSION” is present in Localstring variable or not.
        Boolean containsSession3=LocalString.contains('SESSION');
        system.debug('contains -session-? '+containsSession3);
    }
    
}