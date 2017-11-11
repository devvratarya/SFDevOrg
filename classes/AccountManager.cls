/**
 * Created by darya on 11/10/2017.
 */

@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String actId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account act =  [SELECT Id,Name, (Select Id, Name FROM Contacts)
                        FROM Account
                        WHERE Id = :actId];
        return act;
    }
}