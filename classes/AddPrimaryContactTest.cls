@isTest
private class AddPrimaryContactTest
{
	@testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();

        for (Integer i = 0; i < 50; i++) {
			accounts.add(new Account(name='NY'+i, BillingState='NY'));
			accounts.add(new Account(name='CA'+i, BillingState='CA'));
        }
        insert accounts;
    }
	@isTest
	static void itShould()
	{
		Contact c = new Contact(lastName='contactCA');
		AddPrimaryContact contAdder = new AddPrimaryContact(c, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(contAdder);
		Test.stopTest();
		 System.assertEquals(50, [select count() from contact],'This is not equal');
	}
	
}