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

        RestRequest request = new RestRequest();
        //ENDPOINT: 
        request.requestURI = homeUrl + '/services/apexrest/Case/'+cs.Id;
        request.httpMethod ='GET';

        //2-prepare RestContext
        RestContext.request = request;

        //3-test and assert the business method
        Case objCase = CaseManager.getCaseById();
        system.assertEquals(cs.Id, objCase.Id);
        system.assertEquals(cs.Subject, objCase.Subject);
    }
    @isTest
    private static void postCaseTest(){
         // 1. Prepare RestRequest
         Case cs = new Case(Subject='Test Subject',
         Description = 'Test Description',
         Origin = 'Email',
         Type = 'Electrical',
         Priority = 'High',
         Status = 'New');

String body = JSON.serialize(cs);

RestRequest request = new RestRequest();
request.requestBody = Blob.valueOf(body);

request.httpMethod = 'POST';

// 2. Prepare RestContext
RestContext.request = request;

// 3. Test and assert the business method
Id caseId = CaseManager.postCase();

//Assert

Case resultCase = [SELECT Id, Subject, Description FROM Case WHERE Subject = 'Test Subject' LIMIT 1];
System.assertEquals('Test Description', resultCase.Description);
System.assertNotEquals(null, resultCase.Id);


    }
    @isTest 
    private static void putCaseTest(){
        //Scenerio 1 = insert operation
        //test the method
      Id caseId  =CaseManager.putCase(null, 'Test Put Subject', 'Electrical', 'High');
    //assertion
      system.assertNotEquals(null, caseId);
      case cs1 = [Select Subject, Type, Priority from Case Where Id =: caseId ];
      system.assertEquals('Test Put Subject', cs1.Subject);

      //Scenerio 2 = Update Operation
   Id sameCaseId = CaseManager.putCase(caseId, 'Test Put Subject-Updated Record', 'Mechanical', 'Low');

    System.assertEquals(caseId, sameCaseId);

    }
    @isTest  
    private static void patchCaseTest(){
         // create a Case object to update
    Case cs = new Case(Subject = 'Test Case');
    insert cs;

    // create a RestRequest with a JSON body that updates the Case
    RestRequest request = new RestRequest();
    request.requestURI = '/services/apexrest/cases/' + cs.Id;
    request.httpMethod = 'PATCH';
    request.requestBody = Blob.valueOf('{"Subject":"Updated Test Case"}');

    // set the RestContext properties for the request
    RestContext.request = request;
    RestContext.response = new RestResponse();

    // call the patchCase method
    Case updatedCase = CaseManager.patchCase();

    // assert that the Case was updated correctly
    System.assertEquals('Updated Test Case', updatedCase.Subject);

    }

    @isTest  
    private static void deleteCaseTest(){
         // create a Case object to delete
         Id caseId  =CaseManager.putCase(null, 'Test Put Subject', 'Electrical', 'High');
         
         RestRequest request = new RestRequest();
         request.requestURI = '/services/apexrest/cases/' + caseId;
         
         request.httpMethod = 'DELETE';  
         
         RestContext.request = request;
         RestContext.response = new RestResponse();
     
         // call the deleteCase method
         String result = CaseManager.deleteCase();
     
         // assert that the Case was deleted correctly
         System.assertEquals('Success', result);
         try {
             Case deletedCase = [SELECT Id FROM Case WHERE Id = :caseId];
             System.assert(false, 'Expected exception not thrown');
         } catch (Exception e) {
             // expected exception
         }
        } 

}