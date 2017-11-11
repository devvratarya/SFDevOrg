/**
 * Created by darya on 11/10/2017.
 */
@IsTest
public with sharing class AwesomeCalculatorTest {
    @IsTest static void testCallout(){
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock());
        Double x = 1.0;
        Double y = 2.0;
        Double result = AwesomeCalculator.add(x,y);
        System.assertEquals(3.0,result);
    }
}