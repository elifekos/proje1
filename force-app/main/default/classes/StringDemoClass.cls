public class StringDemoClass {
    public void stringMethod1() {
        string sessionDescription = 'Learning string methods in apex language';
        system.debug(sessionDescription);

        //1.length
        integer lengthOfStr=sessionDescription.length();
        system.debug('length of session description string: '+lengthOfStr );

        //2.convert the string to Caps
        string capitalStr=sessionDescription.toUpperCase();
        system.debug('session description in CAPITAL: '+capitalStr);

        //3.CHECK IF OUR STRING HAS 'APEX'in it.
        Boolean containsApex=sessionDescription.contains('apex');
        system.debug('contains apex??? '+containsApex);

        Boolean containsApex2=sessionDescription.contains('Apex');
        system.debug('contains apex 2??=> '+containsApex2);

        Boolean containsApex3=sessionDescription.containsIgnoreCase('APEX');
        system.debug('contains ignore case APEX?=> '+CONTAINSAPEX3);

        //4.Check if our string has 'salesforce' in it.
        Boolean containsSalesforce1 = sessionDescription.contains('salesforce');
        System.debug('Contains apsalesforceex ??? ' + containsSalesforce1);
        Boolean containsSalesforce2 = sessionDescription.containsIgnoreCase('salesforce');
        System.debug('Contains ignore case apex ??? ' + containsSalesforce2);

        string username=' vitapr ';
        system.debug('length of username is '+username.length());
        String username2=username.trim();
        system.debug('length of username2 is '+username2.length());

    }
}