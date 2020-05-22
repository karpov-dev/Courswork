@IsTest
public class RequestDataFactory {
    public static RestRequest getRestRequest(String path, String method, Map<String, String> params){
        RestRequest request = new RestRequest();
        if(String.isBlank(path) || String.isBlank(method) || params == null) return request;

        String baseUrl = Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/' + path + '/?';
        Boolean isFirstElement = true;
        for(String key : params.keySet()){
            request.params.put(key, params.get(key));
        }

        request.requestURI = baseUrl;
        request.httpMethod = method;
        return  request;
    }
}