/**
 * Created by darya on 11/10/2017.
 */

@IsTest
private class ParkLocatorTest {
    static testMethod void testBehavior() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String country = 'India';
        String[] parks = ParkLocator.country(country);
        System.debug(parks);
    }
}