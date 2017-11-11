/**
 * Created by darya on 11/10/2017.
 */

public with sharing class ParkLocator {
    public static String[] country(String country){
        ParkService.ParksImplPort ps = new ParkService.ParksImplPort();
        String[] response = ps.byCountry(country);
        System.debug('Park names in '+country+':');
        for (Integer i = 0; i < response.size(); i++) {
            System.debug(response[i]);
        }
        return response;
    }
}