public class SetDemo {
    public static void citySet() {
        Set<string> cities = new Set<string>();
        //.add
        cities.add('Tokyo');
        cities.add('Nairobi');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Tokyo');
        cities.add('Nairobi');
        cities.add('BERLIN');
      
        system.debug('set of cities '+cities);
    }
    public static void randomIntegerSet(){
        Set<integer> integerSet = new Set<integer>();
        integerSet.add(10);
        integerSet.add(15);
        integerSet.add(21);
        integerSet.add(15);
        integerSet.add(15);

        system.debug('set of integers '+integerSet);
    }
    //CREATE A METHOD.wHICH ACCEPTS A LIST<INTEGR> and it returns set<integer>
    //if our list has duplicate elements it will be removed,
    public static set<Integer> setFromList(list<integer>intList){
        //create new empty set.
        Set<integer> returnSet = new set<integer>();
        //add all the elements of a list using.addAll(list_or_set)method
        returnSet.addAll(intList);
        //return the newly created set
        return returnSet;
    }
    //WE ARE CREATING A METHOD
        //which accepts set<string>

        public static Set<string> uppercaseSet(set<string>setStr){
            //create a temp set in which we will add uppercase elements
            set<string>upprSet= new set<string>();
            //for each loop on setStr(passed in parameter)
            
            for(string eachStr : setStr){
                system.debug('each str is  '+eachStr);
                string tempstr=eachStr.toUpperCase();
                upprSet.add(tempstr);

            }
            return upprSet;
        }
}