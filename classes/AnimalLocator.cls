/**
 * Created by darya on 11/10/2017.
 */

public with sharing class AnimalLocator {

    public class JSON2Apex {
        public Animal animal;
    }

    public class Animal {
        public Integer id;
        public String name;
        public String eats;
        public String says;
    }

    public static String getAnimalNameById(Integer input){
        String ret;
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        String endPointURL = 'https://th-apex-http-callout.herokuapp.com/animals/'+input;
        req.setEndpoint(endPointURL);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        if(res.getStatusCode() == 200){
            JSON2Apex animal = (JSON2Apex) System.JSON.deserialize(res.getBody(), JSON2Apex.class);
            //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            // Cast the values in the 'animals' key as a list
            //List<Object> animals = (List<Object>) results.get('animal');
            System.debug('name of the animal: '+animal.animal.name);
            ret = animal.animal.name;
        }
        return ret;
    }
}