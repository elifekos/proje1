public with sharing class RestCalloutCase {
    public static HttpResponse getCase(){
        //1-Prepare Http Request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:NC_OrgIntegration/services/apexrest/Case/500Dn000007cClKIAU');//Case Id yi Target Org tan aliyoruz
        request.setMethod('GET');

        //PREPARE INTERNET
        Http http = new Http();

        //3- Send HttpRequest over internet
        HttpResponse response = http.send(request);

        //Process Httpresponse
       //if(response.getStatusCode()== 200){
        System.debug(response.getStatus());
        system.debug('JSON Format: '+response.getBody());
        string body = response.getBody();
       Case cs = (Case)JSON.deserialize(body,Case.class);
      // } 
       return response;

    }
}