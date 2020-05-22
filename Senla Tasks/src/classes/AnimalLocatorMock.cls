/**
 * Created by passa on 20.05.2020.
 */

@IsTest
global class AnimalLocatorMock implements HttpCalloutMock{

    global HttpResponse respond(HttpRequest param1) {
        HttpResponse mockResponse = new HttpResponse();
        mockResponse.setHeader('Content-Type', 'application/json');
        mockResponse.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        mockResponse.setStatusCode(200);
        return  mockResponse;
    }

}