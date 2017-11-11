/**
 * Created by darya on 11/10/2017.
 */

@IsTest
private class AccountManagerTest {
    static testMethod void testBehavior() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
                'https://testdomain1508-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
                        + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account act = AccountManager.getAccount();
        System.assert(act.id != null);
        System.assertEquals(2,act.Contacts.size());
        System.debug(act.Contacts.get(0).Name);
    }
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account a = new Account(name='RestTestAct');
        insert a;
        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(LastName='RestTestContact1', AccountId=a.Id));
        contacts.add(new Contact(LastName='RestTestContact2', AccountId=a.Id));
        insert contacts;
        return a.Id;
    }
}