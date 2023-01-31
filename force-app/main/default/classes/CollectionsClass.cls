public  class CollectionsClass {
    public static string listaAssignment(integer i){
       List<string> lstMonth = new List<string>(); 
       string outputMonth;
      
       lstMonth.add('January');
       lstMonth.add('Februarry');
       lstMonth.add('March');
       lstMonth.add('April');
       lstMonth.add('May');
       lstMonth.add('June');
       lstMonth.add('July');
       lstMonth.add('August');
       lstMonth.add('September');
       lstMonth.add('October');
       lstMonth.add('November');
       lstMonth.add('December');
        integer listSize=lstMonth.size();
      
       if(i>listSize){
           outputMonth='Not a valid month';
       }else if(i<1){
        outputMonth='Not a valid month';
       }else{
        outputMonth=lstMonth[i-1];
       }
       return outputMonth;

    }
    
}