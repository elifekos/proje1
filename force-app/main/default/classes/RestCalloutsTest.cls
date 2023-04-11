@isTest
public with sharing class RestCalloutsTest {
    @isTest
    private static void getAnimalsTest(){
        //set the mock
        RestCalloutsMock mock = new RestCalloutsMock();
        test.setMock(HttpCalloutMock.class, mock);

        //test the mock
        HttpResponse response = RestCallout.getAnimal();
        //Run Assert
        system.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
    }
    
}