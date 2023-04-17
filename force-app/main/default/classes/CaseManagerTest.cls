@isTest
public with sharing class CaseManagerTest {
    @TestSetup
    private static void makeData(){
        list<Case> cases = new list<Case>();
        for(integer i = 0; i<3; i++){
            Case cs = new Case(Subject = 'Test Subject'+i, 
                                Description = 'Test Description'+i,
                                Origin = 'Email',
                                Type = 'Electrical',
                                Priority = 'High',
                                Status = 'New');
             cases.add(cs);
                                

        }
       insert cases; 
    }

    @isTest  
    private static void getCaseTest(){
        //1-prepare RestRequest
        string homeUrl = system.URL.getSalesforceBaseUrl().toExternalForm();
        Case cs = [Select id, subject, Priority FROM Case Limit 1];

        RestRequest request = new RestRequest();+cs.Id;
        //ENDPOINT: 
        request.requestURI = homeUrl + '/services/apexrest/Case/'+cs.Id;
        request.httpMethod ='GET';
        //2-prepare RestContext
        RestContext.request = request;
        //3-test and assert the business method
    }
    
}