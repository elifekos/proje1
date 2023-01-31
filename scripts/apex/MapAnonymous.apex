//map is key word  to create a map
//1st datatype 
//value datatype 

Map<String, String> mapCntCurrency= new Map<String, String>();
//datatype of key 
mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('France', 'Euro');
mapCntCurrency.put('Germany', 'Euro');
mapCntCurrency.put('India', 'Rupees');
mapCntCurrency.put('India', 'Rupee');
mapCntCurrency.put('Turkiye', 'Lira');
mapCntCurrency.put('El Salvador', 'Bitcoin');
mapCntCurrency.put('Canada', 'CA Dollar');
mapCntCurrency.put('Canada', 'Canadian Dollar');
system.debug(mapCntCurrency);

//get value(currency for India and Turkey)
string IndiaCurrency=mapCntCurrency.get('India');
system.debug('India currency is '+IndiaCurrency);
string TurkiyeCurrency=mapCntCurrency.get('Turkiye');
system.debug('Turkiye currency is '+TurkiyeCurrency);

Set<String> countries=mapCntCurrency.keySet();
system.debug('all countries in the map are '+countries);

List<String> currencies = mapCntCurrency.values();
system.debug('all currencies '+currencies);

//---for each loop starts

Set<String> countrySet=mapCntCurrency.keySet();
for(string eachKey: countrySet){
    string printString=' Country is '+eachKey;
    system.debug(printString);

    string eachValue=mapCntCurrency.get(eachKey);
    printString+= ', its currency is '+eachValue;
    system.debug(printString);
    
}
