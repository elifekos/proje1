public  class ListDemo {
    public static string candidatesList(integer i){
        //List
            //Data type
        List<string> listCandidates = new List<string>();
        listCandidates.add('Marc');
        listCandidates.add('Elon');
        listCandidates.add('Bill');
        listCandidates.add('Marc');
        system.debug('Candidates list is '+listCandidates);
        string candidate = '';
        if(i>=0 && i<listCandidates.size()){
            candidate=listCandidates[i];
        }else{
            candidate='No such candidate found.Try again. ';
        }
        return candidate;
    }
    public static void randomIntegerList(){
        List<Integer> listInteger = new List<Integer>();
        listInteger.add(10);//0
        listInteger.add(15);//1
        listInteger.add(21);//2
        listInteger.add(15);//3
        listInteger.add(15);//4
        SYSTEM.DEBUG('LIST OF RANDOM INTEGERS IS '+listInteger);

        //get the value at index3
        integer index3value=listInteger.get(3);
        //OR
        integer index3value2=listInteger[3];
        system.debug('value at index 3 '+index3value);
        system.debug('value at index 3, again '+index3value2);
    }
    public static void allCats(){
        cat c2=new cat('fluffykins','white');
        cat c1=new cat('tekir', 'black');
        cat sfcat=new cat();

        List<cat> cats = new List<cat>();
        //how to add elements of cat class?
            //we can add instances of cat class in list<cat>
        cats.add(c1);
        cats.add(c2);
        cats.add(sfcat);
        system.debug('all cats '+cats);
        if(!cats.isEmpty()){
            system.debug(cats[0]);
        }
    }
    public static void iterateListInteger(){
        List<integer> listInteger = new List<integer>();
        listInteger.add(10);//0
        listInteger.add(15);//1
        listInteger.add(21);//2
        listInteger.add(15);//3
        listInteger.add(15);//4

        for(integer eachInteger: listInteger){
            system.debug(eachInteger);
        }
    }
    public static integer add(List<integer>listInt){
        //a temporary variable to store sum of each integer in the list
        integer sum=0;

        for (integer eachInt:listInt){
            sum+=eachInt;
        }
        return sum;
    }
    
}

    

    
