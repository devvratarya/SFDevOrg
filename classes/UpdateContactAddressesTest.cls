/**
 * Created by darya on 11/9/2017.
 */

@IsTest
private class UpdateContactAddressesTest {
    @TestSetup
    static void setup(){
        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 100; i++) {
              accounts.add(new Account(name='Account'+i,BillingCity='New York', BillingCountry='USA'));
        }
        insert accounts;
        for (Account account : accounts) {
            contacts.add(new Contact(FirstName='first', LastName='last',AccountId=account.Id));
            contacts.add(new Contact(FirstName='first2', LastName='last2',AccountId=account.Id));
        }
        insert contacts;
    }
    static testMethod void testUpdateContactAddressesBatch() {
        Test.startTest();
        UpdateContactAddresses uca = new UpdateContactAddresses();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        System.assertEquals(200, [SELECT COUNT() FROM Contact WHERE MailingCity='New York'],'They are not equal');
    }
}