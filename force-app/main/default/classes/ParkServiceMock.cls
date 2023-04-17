public with sharing class ParkServiceMock implements WebServiceMock{
    public void doInvoke (Object stub, 
                        Object soapRequest,
                         Map<String,Object> responseMap, 
                         String endpoint, 
                         String soapAction, 
                         String requestName, 
                         String responseNamespace,
                        String responseName,
                        String responseType) {
     ParksServices.byCountryResponse response_x =new  ParksServices.byCountryResponse();
     response_x.return_x = new list<string>{'US National Park', 'Yellowstone National Park', 'Yedigoller National Park'}; 
     responseMap.put('response_x',response_x);                    

    }
}