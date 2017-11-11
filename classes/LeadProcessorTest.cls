/**
 * Created by darya on 11/9/2017.
 */

@IsTest
private class LeadProcessorTest {
    @TestSetup
    static void setup(){
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 100; i++) {
            Lead lead = new Lead(LastName='Test'+i,Company='LComp'+i);
            leads.add(lead);
        }
        insert leads;
    }
    static testMethod void testLeadProcessorBatch() {
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals(100, [SELECT COUNT() FROM LEAD WHERE LeadSource='Dreamforce'], 'This is not equal');
    }
}