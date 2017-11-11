trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account a : Trigger.new){
        if(a.BillingPostalCode != NULL && a.Match_Billing_Address__c){
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
}