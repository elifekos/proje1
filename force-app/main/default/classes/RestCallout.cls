public with sharing class RestCallout {
    
    //Endpoint : https://th-apex-http-callout.herokuapp.com/animals
    //HTTP Method : GET
    public static HttpResponse getAnimal(){
        //1- Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new  HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
/*
        //bu kisim kullanisli olmadigi icin named credentials ten olusturuyoruz new legacy kismindan
        string username = 'elife@gmail.com';
        string password = 'Test1234';
        Blob requestBlob = Blob.valueOf(username + ' : '+ password);
       string authorizationString='BASIC'+ EncodingUtil.base64Encode(requestBlob);
       request.setHeader('Authorization', authorizationString);
*/       

        //2-Prepare Internet
        Http http = new Http();

        //3- Send the HttpRequest over the internet in order to receive HttpResponse back
        HttpResponse response = http.send(request);

        //4-Process HttpResponse
        system.debug(response.getStatusCode());
        system.debug(response.getBody());
        
        return response;

    }

   /* public static HttpResponse getAirlines(){
         //1- Prepare HttpRequest and wrap all the necessary data in it.
         HttpRequest request = new HttpRequest();
         request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
         request.setMethod('GET');

         //2-Prepare Internet
         Http http = new Http();

          //3- Send the HttpRequest over the internet in order to receive HttpResponse back
          HttpResponse response = http.send(request);

          //4-Process HttpResponse
          if(response.getStatusCode() ==200){
            String jsonString = response.getBody();
            system.debug(jsonString);
        } 
        return response;
    }*/

    public static HttpResponse getEmployees(){
         //1- Prepare HttpRequest and wrap all the necessary data in it.
         HttpRequest request = new HttpRequest();
         request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
         request.setMethod('GET');

         //2-Prepare Internet
         Http http = new Http();

          //3- Send the HttpRequest over the internet in order to receive HttpResponse back
          HttpResponse response = http.send(request);

          //4-Process HttpResponse
          if(response.getStatusCode() ==200){
            String jsonString = response.getBody();
            //system.debug(jsonString);

            //Deserialize JSON format message to Apex Format(jsonu apex e ceviriyor)-cevirmek istedigim object ve bu object employeeresponse= wrapperclass
            //jsonString :jsonString      , apex: wrapper class
            EmployeeResponse empRes = (EmployeeResponse) JSON.deserialize(jsonString, EmployeeResponse.class);

            //object icin list icini tanimlarken mainclass.innerclass
            list<EmployeeResponse.EmployeeWrapper> empData = empRes.data;
            list<Employee__c> employees = new  list<Employee__c>();

            for(EmployeeResponse.EmployeeWrapper wrap : empData){
                //orgtaki object  fieldlerine gore define edilecek
                //ilk ksisim org field, ikinci kisim JSON dAKI KISMA GORE
                Employee__c emp = new Employee__c();
                emp.Name = String.valueOf(wrap.id);//id string ama name  number oldugu icin bunu yaptik
                emp.User_Name__c = wrap.username;
                emp.Name__c = wrap.name;
                emp.Email__c =wrap.email;
                emp.Gender__c = wrap.gender;
                emp.Designation__c = wrap.designation;
                emp.Phone__c = wrap.phone_number;
                emp.Address__c = wrap.complete_address;

                employees.add(emp);
            }
            try{
                insert employees;

            }catch(Exception ex){
                system.debug(ex.getMessage());
            }
        } 

        return response;
    }

    public static HttpResponse postEmployee(){

        //1-Prepare HttpRequest with body
        HttpRequest request =new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('POST');
        //1.a. Set header based on the body type
        request.setHeader('Content-Type', 'application/json');

        EmployeeResponse.EmployeeWrapper ew = new EmployeeResponse.EmployeeWrapper();
        ew.name = 'John Smith';
        ew.username = 'blackhead';
        ew.email = 'js@gmail.com';
        ew.gender= 'Male';
        ew.designation = 'Salesforce Developer';
        ew.phone_number = '9878909';
        ew.complete_address ='8947 Howell Mountains South Kavon, VT 89670-8443';

        string jsonBody = JSON.serialize(ew);

        //1.b. Set body for request
        request.setBody(jsonBody);

        //2.Prepare Internet
        Http http = new Http();

        //SEND REQUEST AND HANDLE RESPONSE
        HttpResponse response = http.send(request);

        //4. process HttpResponse
        system.debug(response.getStatusCode());
        if(response.getStatusCode()==200){
            String jsonString = response.getBody();
        //parantez icini type casting yani class varaible de decimal, floot vb farkliliklari convert ediyor
            EmployeePostResponse epr = (EmployeePostResponse)JSON.deserialize(jsonString, EmployeePostResponse.class);
            system.debug(epr);
            system.debug('Name : '+epr.data.name);
            system.debug('Username : '+epr.data.username);
            system.debug('Id : '+epr.data.id);
            system.debug('Designation : '+epr.data.designation);
            system.debug('Email : '+epr.data.email);
            system.debug('Phone : '+epr.data.phone_number);
        }
        return response;
    }

    public static HttpResponse deleteEmployee(){
        //endpoint: https://api.onlinewebtutorblog.com/employees/1
        //http method : Delete
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees/1');
        request.setMethod('DELETE');

          //2.Prepare Internet
          Http http = new Http();

          //SEND REQUEST AND HANDLE RESPONSE
          HttpResponse response = http.send(request);

          if(response.getStatusCode() == 200){
            String jsonString = response.getBody();
            System.debug(jsonString);

            EmployeeResponse emr = (EmployeeResponse) JSON.deserialize(jsonString, EmployeeResponse.class);

            System.debug(emr.msg);
        }
                
          return response;
    }



    
}