public class Collections_Assignments {
    public void listMethods(){
        List<string> days = new List<string>();
        days.add('Monday');
        days.add('Wednesday');
        days.add('Thursday');
        days.add('Friday');
        days.add('Saturday');
        days.add('Sunday');
        system.debug(days);
        days.add(1, 'Tuesday');
        days.add(6,'Labor Day');
        system.debug('updated days and Labor day: '+days);
        days.remove(6);
        system.debug('Labor day remove list: '+days);
        Boolean result=days.contains('Labor Day');
        system.debug('Labor Day: '+result);
        string getIndex=days.get(3);
        system.debug('Index 3 is: '+getIndex);
        Boolean isEmpty=days.isEmpty();
        system.debug('isEmpty: '+isEmpty);
        days.sort();
        system.debug('Sort of the list: '+days);
        system.debug('size of the list: '+days.size());
    }
    public void setMethods(){
        List<string> days = new List<string>();
        days.add('Monday');
        days.add('Tuesday');
        days.add('Wednesday');
        days.add('Thursday');
        days.add('Friday');
        days.add('Saturday');
        days.add('Sunday');
        system.debug(days);
        Set<String> daySet = new Set<String>();
        daySet.addAll(days);
        system.debug(daySet);

        Boolean LaborDay=daySet.contains('Labor Day');
        SYSTEM.DEBUG('Contains Labor Day: '+LaborDay);
        
        integer result3=daySet.size();
        system.debug('size of set: '+result3);

        boolean result=dayset.removeAll(days);
        system.debug('result is: '+result);

        boolean result2=daySet.isEmpty();
        system.debug('is empty: '+result2);

        daySet.add('SUNDAY');
        daySet.add('sunday');
        system.debug('update: '+daySet);

        for (string eachday : daySet) {
        system.debug('Uppercase of days: '+eachday.toUpperCase());
        }
      
        
       

    
      
       

    }
   
}