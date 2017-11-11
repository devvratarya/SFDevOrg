/**
 * Created by darya on 11/10/2017.
 */

public with sharing class DevComm_9060G000000MUKFQA4 {
    Public static void updateCaseLookupInOpportunity(List < Case > OldCaseRecords, List < Case > NewCaseRecords, Map<ID, Case> OldMap, Map<ID, Case> NewMap) {
        if(NewCaseRecords==null){
            CaseTriggerHandler.updateCaseLookupInOpportunityDel(OldCaseRecords);
        }
        if(OldCaseRecords==null){
            CaseTriggerHandler.updateCaseLookupInOpportunityInsert(NewCaseRecords);
        }
        if(OldMap!=null && NewMap!=null){
            Map<Case,Case> z=new Map<Case, Case>();
            List<Opportunity> opp=new List<Opportunity>();
            for(Id i2:oldMap.keyset()){
                for(Id i1:NewMap.keyset()){
                    if(i2==i1){
                        z.put(oldMap.get(i2),NewMap.get(i1));
                    }
                }
            }
            List<Case> l=new List<Case>();
            List<Case> l1=new List<Case>();
            List<Case> l2=new List<Case>();
            List<Case> l3=new List<Case>();
            List<Case> l4=new List<Case>();
            for(case c1:z.keyset()){
                case c2= z.get(c1);
                if((c1.Opportunity__c==Null && c2.Opportunity__c!=Null) || (c2.Opportunity__c!=Null && c1.Opportunity__c==c2.Opportunity__c)){
                    l.add(c2);
                }
                if(c1.Opportunity__c!=Null && c2.Opportunity__c==Null){
                    l1.add(c1);
                }
                if(c1.Opportunity__c!=Null && c2.Opportunity__c!=Null && c1.Opportunity__c!=c2.Opportunity__c){
                    l2.add(c1);
                    l3.add(c2);
                }
            }
            if(!l.isEmpty()){
                CaseTriggerHandler.updateCaseLookupInOpportunityInsert(l);
            }
            if(!l1.isEmpty()){
                CaseTriggerHandler.updateCaseLookupInOpportunityDel(l1);
            }
            if(!l2.isEmpty() && !l3.isEmpty()){
                CaseTriggerHandler.updateCaseLookupInOpportunityDel(l2);
                CaseTriggerHandler.updateCaseLookupInOpportunityUpdate(l3);
            }
        }
    }



}