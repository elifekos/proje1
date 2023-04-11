public with sharing class RestCalloutsMock implements  HttpCalloutMock{
    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setHeader('Content-Type', 'application/json;charset=UTF-8');
        response.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
        return response;

    }
}