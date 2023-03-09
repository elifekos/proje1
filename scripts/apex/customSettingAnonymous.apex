Map<string, country_code__c> mapCountryCode = country_Code__c.getAll();
system.debug(mapCountryCode);

//print 'Country name is United States its code is USA'

for(string eachName : mapCountryCode.keySet()){
    country_code__c c = mapCountryCode.get(eachName);
    system.debug('Country name is '+eachName + '  its code is '+c.code__c);
}

Country_code__c c1 = Country_code__c.getInstance('India');
System.debug('c1 code is '+c1.code__c);

//OLD OPTION
list<Country_code__c> allCC = [SELECT ID, NAME, code__c from Country_code__c];