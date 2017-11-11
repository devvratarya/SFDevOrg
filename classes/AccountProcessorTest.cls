/**
 * Created by darya on 11/9/2017.
 */
@IsTest
private with sharing class AccountProcessorTest {

    public static testMethod void testCountContacts(){
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(Name='Test1'));
        accounts.add(new Account(Name='Test2'));
        insert accounts;
        List<Contact> contacts = new List<Contact>();

// Creating two contact objects and setting mandatory fields
        Contact contact1 = new Contact(LastName = 'LastName1',
                AccountId = accounts[0].id);
        Contact contact2 = new Contact(LastName = 'LastName2',
                AccountId = accounts[1].id);
        Contact contact3 = new Contact(LastName = 'LastName2_2',
                AccountId = accounts[1].id);

// Adding contacts to the list
        contacts.add(contact1);
        contacts.add(contact2);
        contacts.add(contact3);

// Inserting new contacts
        insert contacts;
        List<Id> accountIds = new List<Id>(new Map<Id, Account>(accounts).keySet());
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
    }
}