/**
 * Created by darya on 11/10/2017.
 */

public with sharing class CaseTriggerHandler {
    Public static void updateCaseLookupInOpportunityDel(List < Case > OldCaseRecords){
        List<Case> c=OldCaseRecords;
        List<Opportunity> opp=new List<Opportunity>();
        List<Id> i= new List<Id>();
        for(Case c1:[SELECT Id, Opportunity__r.Case__c FROM Case Where Id IN: c]){
            if(c1.Opportunity__c!=NULL && c1.Opportunity__r.Case__c==c1.Id){
                i.add(c1.Opportunity__c);
            }

        }

        if(!i.isEmpty()){
            List<Opportunity> o=[Select id,Case__c,(Select Id,CaseNumber,CreatedDate,Opportunity__r.Case__c from Cases__r) from Opportunity Where Id IN :i];
            for(Opportunity o1:o){
                DateTime d;
                DateTime d1;
                Id i1;
                for(case c1:o1.Cases__r){
                    d=c1.CreatedDate;
                    if((d1==Null || d1<d) && !(c1.Opportunity__r.Case__c==c1.Id)){
                        d1=d;
                        i1=c1.Id;
                    }
                }
                o1.Case__c=i1;
                opp.add(o1);
            }
        }
        Update opp;
    }

    Public static void updateCaseLookupInOpportunityInsert(List < Case > NewCaseRecords){
        List<Case> c=NewCaseRecords;
        Map<Case, Opportunity> m = new Map<Case, Opportunity>();
        List<Opportunity> opp=new List<Opportunity>();
        List<Id> i= new List<Id>();
        for(Case c1:c){
            if(c1.Opportunity__c!=NULL ){
                i.add(c1.Opportunity__c);
            }
        }
        if(!i.isEmpty()){
            List<Opportunity> o=[Select id,Case__c,(Select Id,CaseNumber,CreatedDate,Opportunity__r.Case__c from Cases__r) from Opportunity Where Id IN :i];
            for(Opportunity o1:o){
                for(case c1:c){
                    if(c1.Opportunity__c==o1.Id){
                        m.put(c1,o1);
                        break;
                    }
                }

            }
        }
        for(Case c1:m.keyset()){
            Opportunity o2=m.get(c1);
            o2.Case__c=c1.Id;
            opp.add(o2);
        }
        Update opp;
    }

    Public static void updateCaseLookupInOpportunityUpdate(List < Case > NewCaseRecords){
        List<Case> c=NewCaseRecords;
        Map<Case, Opportunity> m = new Map<Case, Opportunity>();
        List<Opportunity> opp=new List<Opportunity>();
        List<Id> i= new List<Id>();
        for(Case c1:c){
            if(c1.Opportunity__c!=NULL ){
                i.add(c1.Opportunity__c);
            }
        }
        if(!i.isEmpty()){
            List<Opportunity> o=[Select id,Case__c,(Select Id,CaseNumber,CreatedDate,Opportunity__r.Case__c from Cases__r) from Opportunity Where Id IN :i];
            for(Opportunity o1:o){
                for(case c1:c){
                    if(c1.Opportunity__c==o1.Id){
                        m.put(c1,o1);
                        break;
                    }
                }

            }
        }
        for(Case c2:m.keyset()){
            Opportunity o2=m.get(c2);
            DateTime d;
            DateTime d1;
            Id i1=c2.Id;
            for(case c1:o2.Cases__r){
                d=c1.CreatedDate;
                if((d1==Null || d1<d) && !(c1.Opportunity__r.Case__c==c1.Id)){
                    d1=d;
                    i1=c1.Id;
                }
            }
            o2.Case__c=i1;
            opp.add(o2);
        }
        Update opp;

    }
}