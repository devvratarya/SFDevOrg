@isTest
private class TestVerifyDate {
	static testMethod void testCheckDates() {
    	// code_block
    	// 
    	Date d1 = Date.today();
        Date d2 = d1.addDays(10);
        Date testDateWithin30Days = VerifyDate.CheckDates(d1,d2);
        System.debug('testDateWithin30Days adddays 10: '+ testDateWithin30Days.day());
        d2 = d1.addDays(40);
        Date testSetEndOfMonthDate = VerifyDate.CheckDates(d1,d2);
		System.debug('testSetEndOfMonthDate adddays 40: '+ testSetEndOfMonthDate.day());
        d2 = d1.addDays(-10);
        System.debug('testSetEndOfMonthDate adddays -10: '+ testSetEndOfMonthDate.day());
        testSetEndOfMonthDate = VerifyDate.CheckDates(d1,d2);
        //boolean SetEndOfMonthDate = VerifyDate.SetEndOfMonthDate();
	}

}