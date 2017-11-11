/**
 * Created by darya on 11/9/2017.
 */

public with sharing class AccountProcessor {
    @Future
    public static void countContacts(List<Id> actIds){
        list<Account> accList= new list<Account>();
        AggregateResult[] counts  =[select  AccountId, count(id) total_contacts
        from contact
        where AccountId in : actIds
        group by AccountId];
        for (AggregateResult ar : counts) {
            Account ac = new Account(Id=string.valueof(ar.get('AccountId')),Number_of_Contacts__c=integer.valueof(ar.get('total_contacts')));
            accList.add(ac);
        }
        upsert accList;
    }
}