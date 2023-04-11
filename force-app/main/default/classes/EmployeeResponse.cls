public with sharing class EmployeeResponse {
   public integer error;
   public string  msg;
   public list<EmployeeWrapper> data;

   public class EmployeeWrapper{
    //bu class inner class, cunku data ya ait veriler bu kisimda
    //id, username, name, email, gender,... Bu field ler orgtaki degil fake ipa kismindaki kisimla ayni olmali
      public integer  id;
       public string username;
       public string name;
       public string email;
       public string gender;
       public string designation;
       public string phone_number;
       public string complete_address;
   }
   
}