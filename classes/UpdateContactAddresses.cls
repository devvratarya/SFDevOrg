/**
 * Created by darya on 11/9/2017.
 */

global class UpdateContactAddresses implements Database.Batchable<sObject>, Database.Stateful{
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc){
        String query= 'SELECT Id,BillingCity, BillingCountry, BillingState, BillingStreet, BillingPostalCode,(SELECT ID, MailingCity, MailingState,MailingStreet,MailingCountry,MailingPostalCode FROM Contacts) FROM Account WHERE BillingCountry=\'USA\'';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<Account> scope){
        List<Contact> contacts = new List<Contact>();
        for (Account account : scope) {
            for (Contact contact : account.Contacts) {
                contact.MailingStreet = account.BillingStreet;
                contact.MailingCity = account.BillingCity;
                contact.MailingState = account.BillingState;
                contact.MailingCountry = account.BillingCountry;
                contact.MailingPostalCode = account.BillingPostalCode;
                contacts.add(contact);
                recordsProcessed = recordsProcessed+1;
            }
        }
        update contacts;
        //Future method cannot be called from a future or batch method: AccountProcessor.countContacts(List<Id>)
        //List<Id> accountIds = new List<Id>(new Map<Id, Account>(scope).keySet());
        //AccountProcessor.countContacts(accountIds);

    }

    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processeed. Bingo!');
        AsyncApexJob job = [SELECT Id,Status, NumberOfErrors,JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob                     WHERE ID=:bc.getJobId()];
        //EmailUtils.sendMessage(a, recordsProcessed);

    }
}