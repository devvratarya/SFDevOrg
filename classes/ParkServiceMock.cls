/**
 * Created by darya on 11/10/2017.
 */
@IsTest
global class ParkServiceMock implements WebServiceMock{

    global void doInvoke(
            Object stub,
            Object request,
            Map<String, Object> response,
            String endpoint,
            String soapAction,
            String requestName,
            String responseNS,
            String responseName,
            String responseType){
        ParkService.byCountryResponse response_string = new ParkService.byCountryResponse();
        response_string.return_x = new String[]{'Anamudi Shola National Park','Anshi National Park','Bandipur National Park'};
        response.put('response_x',response_string);
    }
}