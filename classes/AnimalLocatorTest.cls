/**
 * Created by darya on 11/10/2017.
 */

@IsTest
private class AnimalLocatorTest {
    static testMethod void testBehavior() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String response = AnimalLocator.getAnimalNameById(1);
        //String contentType = response.getHeader('Content-Type');
        //System.assert(contentType=='application/json');
        //String actualValue = response.getBody();
        System.debug('name of the animal: '+response);
        String expectedValue = 'chicken';
        System.assertEquals(expectedValue,response);
        //System.assertEquals(200, response.getStatusCode());
    }
}