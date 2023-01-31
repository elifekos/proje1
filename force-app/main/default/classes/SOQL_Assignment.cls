public  class SOQL_Assignment {
    public static void soql_WhereClause() {
        List<Contact> lstContact =[SELECT id, name, phone FROM Contact WHERE name LIKE 'A%'];
        system.debug('list of contact records that name starts with a '+lstContact);

        integer size= lstContact.size();
        system.debug('the size of lstContact is '+ size);

    }
    public static void soql_FromMethod(){
        List<Contact> lstContact =[SELECT id, name, lastname, phone FROM Contact];
        for (Contact eachContact : lstContact){
            string lastName=eachContact.LastName;
            String contPhone= eachContact.Phone;
            system.debug('Contact name is '+ lastName +'Contact phone number is '+ contPhone);
            
        }


    }
}