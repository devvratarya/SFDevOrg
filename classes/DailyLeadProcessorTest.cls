@isTest
private class DailyLeadProcessorTest
{
	public static String CRON_EXP = '0 0 0 15 3 ? 2022';

	@testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // add 100 child accounts
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                    LastName='Test Lead'+i, Company='Company'+i
            ));
        }
        insert leads;
    }

	@isTest
	static void itShould()
	{
		
		Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        // Stopping the test will run the job synchronously
        Test.stopTest();
		// Verify the scheduled job has not run yet.
        List<Lead> lt = [SELECT Id 
            FROM Lead 
            WHERE LeadSource='Dreamforce'];
        System.assertEquals(200, lt.size(), 'Tasks exist before job has run');
	}
}