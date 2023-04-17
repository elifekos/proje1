//Endpoint : https://abcde121-dev-ed.develop.my.salesforce.com/services/apexrest/Case   (main domain org url(clasic formattayken org)+/services/apexrest/+/Case/)
@Restresource(urlMapping = '/Case/*')
global with sharing class CaseManager {

    /*
        *this method is exposing Case record by their Salesfporce Id
        *Endpoint :https://abcde121-dev-ed.develop.my.salesforce.com/services/apexrest/Case/00BDn00000CJia5MAD   (main domain endpoint+case record id)
        *Http Method : GET
    */
    @HttpGet
    global static Case getCaseById(){
        //grab the caseId from the end of the URL
       RestRequest request = RestContext.request;
       string url = request.requestURI; //VARIABLE.field

       //endpointin sonundaki record id lerini almak icin string method hullanilir (lastIndexOf())
       integer lastIndex = url.lastIndexOf('/'); // to find the index of last '/'character
       Id caseId = url.substring(lastIndex+1);

       Case cs = [SELECT Id, CaseNumber, Subject, Description, Type, Priority
                    FROM Case
                    WHERE Id =: caseId ];
        return cs;

    }
    /*This  method will create a new case record
    -We need a bofy part in JSON format
    -Endpoint
   - Http Method : Post -@HttpPost
   -Return : Case Id
    */
    @HttpPost
    global static Id postCase(){
        //1-Get Incoming Rest Callout request context
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString(); //request body sifreli blob data type() olacagi icin toString methoduyla stringe cevrilir
        //2- Deserialize request body to Case sObject--Wrapper classa gerek yok body de cunku Case obj tin iskeleti bizde var, cunku kendi orgumuza ait, ama disardan alirken iskeleti olusturmak zorundayiz ve body icin wrapper class  gerekli
       Case cs = (Case) JSON.deserialize(body, Case.class);
         //3- Insert Case record to SF Org
       insert cs;
       return cs.id; 
    }
    //EndPoint:https://abcde121-dev-ed.develop.my.salesforce.com/services/apexrest/Case
    //Http Method : Update-@HttpPatch

    @HttpPatch
    global static Case patchCase(){
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();

        Case cs = (Case)JSON.deserialize(body, Case.class); //JSON.deserialize(jsonString, apexType)
        update cs;
        return cs;
        
    }
     //EndPoint:https://abcde121-dev-ed.develop.my.salesforce.com/services/apexrest/Case
    //Http Method : Upsert-@HttpPut
    @HttpPut
    global static Id putCase(String Id, String Subject, String Type, String Priority){
        Case cs = new Case();
        cs.Id =Id;
        cs.Subject =Subject;
        cs.Priority =Priority;
        cs.Type =Type;

        upsert cs;
        return cs.Id;
        
    }
      //EndPoint:https://abcde121-dev-ed.develop.my.salesforce.com/services/apexrest/Case
    //Http Method : Delete-@HttpDelete
    @HttpDelete
    Global static String deleteCase(){
        RestRequest request = RestContext.request;
        String url = request.requestURI;
        integer lastIndex = url.lastIndexOf('/');
        Id caseId = url.substring(lastIndex+1);

        try {
            Case cs = [Select Id FROM Case Where Id =: caseId];
            delete cs;
        } catch (Exception ex) {
            return 'Fail';
            
        }
        return 'Success';
    }


    
}