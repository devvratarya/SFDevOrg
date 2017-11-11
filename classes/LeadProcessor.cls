/**
 * Created by darya on 11/9/2017.
 */

global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc){
        String query= 'SELECT Id,LeadSource FROM Lead';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leads = new List<Lead>();
        for (Lead l: scope) {
            l.LeadSource='Dreamforce';
            leads.add(l);
        }
        update leads;
        //Future method cannot be called from a future or batch method: AccountProcessor.countContacts(List<Id>)
        //List<Id> accountIds = new List<Id>(new Map<Id, Account>(scope).keySet());
        //AccountProcessor.countContacts(accountIds);

    }

    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processeed. Bingo!');
        //AsyncApexJob job = [SELECT Id FROM AsyncApexJob                     WHERE ID=:bc.getJobId()];
        //EmailUtils.sendMessage(a, recordsProcessed);

    }
}