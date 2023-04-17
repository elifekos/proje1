public with sharing class DoAddCalloutMock implements WebServiceMock{
    public void doInvoke (Object stub, 
                        Object soapRequest,
                         Map<String,Object> responseMap, 
                         String endpoint, 
                         String soapAction, 
                         String requestName, 
                         String responseNamespace,
                        String responseName,
                        String responseType){
    CalculatorServices.doAddResponse response = new CalculatorServices.doAddResponse();
    response.return_x =45;

    responseMap.put('response_x', response);
     }

}