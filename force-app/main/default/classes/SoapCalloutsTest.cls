@isTest
public with sharing class SoapCalloutsTest {
    @isTest
    private static void parksCalloutTest() {
        //set the mock
        ParkServiceMock mock = new ParkServiceMock();
        Test.setMock(WebServiceMock.class, mock);

        //Test the class(execute apex kismindan al)
        string[]parks = SoapCallouts.parksCallout('United States');

        //Do asserts
        system.assertEquals(3, parks.size());


    }
    @isTest 
    private static void DoAddCalloutTest(){
        DoAddCalloutMock mock = new DoAddCalloutMock();
        test.setMock(WebServiceMock.class, mock);

        Double result = SoapCallouts.doAddCallout(20, 25);
        System.assertEquals(45, result);


    }
}