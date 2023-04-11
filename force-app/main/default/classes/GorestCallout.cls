public with sharing class GorestCallout {
    public static HttpResponse getUsers(){
        //1- Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        request.setMethod('GET');

        //2-Prepare Internet
        Http http = new Http();

         //3- Send the HttpRequest over the internet in order to receive HttpResponse back
         HttpResponse response = http.send(request);

         //4-Process HttpResponse
         list<UserResponse> users = new list<UserResponse>();
         if(response.getStatusCode() ==200){
           
           String jsonString = response.getBody();
           system.debug(jsonString);
         }
         return response;
 }
}

           
           
