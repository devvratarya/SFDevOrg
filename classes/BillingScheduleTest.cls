/**
 * Created by darya on 11/11/2017.
 */

@isTest(SeeAllData=true)
private class BillingScheduleTest{
    /*  @testSetup static void TestBillingSchedule(){

          Account objAccount = new Account();
          objAccount.Name = 'TestAccount';
          objAccount.Phone = '1234567890';
          objAccount.CurrencyIsoCode ='USD';
          insert objAccount;

          Contact objContact = new Contact();
          objContact.LastName = 'test';
          objContact.AccountId = objAccount.Id;
          objContact.Contact_Origination__c = 'LLamasoft';
          objContact.LeadSource = 'Advertisement';
          objContact.Email = 'test@gmail.com';
          objContact.Phone = '1234567890';
          insert objContact;

          Contract objContract = new Contract();
          objContract.AccountId = objAccount.Id;
          objContract.Status = 'Draft';
          objContract.ContractTerm = 1234;
          objContract.StartDate = System.Today();
          objContract.CustomerSignedId = objContact.Id;
          insert objContract;

          Id RecordTypeAssetId = Schema.SObjectType.Asset.getRecordTypeInfosByName().get('License Purchase Detail').getRecordTypeId();
          Asset objAsset = new Asset();
          objAsset.AccountId = objAccount.Id;
          objAsset.Contract__c = objContract.Id;
          objAsset.Name = 'TestAsset';
          objAsset.CurrencyIsoCode = 'USD';
          objAsset.RecordTypeId = RecordTypeAssetId;
          insert objAsset;

          Billing_Schedule__c objBillingSchedule = new Billing_Schedule__c();
          objBillingSchedule.Name = 'TestBillingSchedule';
          objBillingSchedule.Asset__c =  objAsset.Id;
          objBillingSchedule.Contract__c = objContract.Id;
          objBillingSchedule.CurrencyIsoCode = 'USD';
          objBillingSchedule.Start_Date__c = System.Today();
          objBillingSchedule.End_Date__c = System.Today();
          insert objBillingSchedule;

          Opportunity objOpportunity = new Opportunity();
          objOpportunity.Name= 'TestOpportunity';
          objOpportunity.Account= objAccount;
          objOpportunity.Type = 'Renewal';
          objOpportunity.LeadSource = 'Advertisement';
          objOpportunity.CloseDate = System.Today();
          objOpportunity.StageName = 'Prospect';
          objOpportunity.CurrencyIsoCode = 'USD';
          objOpportunity.Next_Steps__c = 'Test Next Step';
          insert objOpportunity;

          Id pricebookId = Test.getStandardPricebookId();

          Product2 objProduct = new Product2();
          objProduct.Name = 'DataGuru Consulting';
          objProduct.IsActive = true;
          insert objProduct;

          PricebookEntry objPricebookEntry =new PricebookEntry();
          objPricebookEntry.Pricebook2Id = pricebookId;
          objPricebookEntry.Product2Id = objProduct.Id;
          objPricebookEntry.UnitPrice = 100.00;
          objPricebookEntry.IsActive = true;
          insert objPricebookEntry;

          System.assertEquals('TestBillingSchedule',objBillingSchedule.Name);

          ApexPages.StandardController controller =new ApexPages.StandardController(objAsset);
          BillingSchedule objBillingSchedule1 = new BillingSchedule(controller);
          objBillingSchedule1.addNewBilling();
          objBillingSchedule1.findReletedAssetBillingSchedule();
          objBillingSchedule1.BindBillingSchedule();
          objBillingSchedule1.removeIndex =0;
          objBillingSchedule1.removeNewBilling();
          objBillingSchedule1.saveBilling();
      }
      */
    static testmethod void TestBillingSchedule1(){

        Asset objAS = [Select Id,Contract__c  From Asset Where Name= 'TestAsset' Limit 1];

        Billing_Schedule__c objBillingSchedule = new Billing_Schedule__c();
        objBillingSchedule.Name = 'TestBillingSchedule';
        objBillingSchedule.Asset__c =  objAS.Id;
        objBillingSchedule.Contract__c = objAS.Contract__c;
        objBillingSchedule.CurrencyIsoCode = 'USD';
        objBillingSchedule.Start_Date__c = System.Today();
        objBillingSchedule.End_Date__c = System.Today().addDays(+15);
        /* Gears DEV - added required payment terms field for object creation and testing. Case 32655 */
        objBillingSchedule.Payment_Terms__c = 30;
        insert objBillingSchedule;

        ApexPages.StandardController controller =new ApexPages.StandardController(objAS);
        BillingSchedule objBillingSchedule1 = new BillingSchedule(controller);
        objBillingSchedule1.saveBilling();

        List<Billing_Schedule__c> BillingSchedulesobj = new List<Billing_Schedule__c>([select id,Name From Billing_Schedule__c where Asset__c =: objAS.Id Order by Start_Date__c asc]);

        System.assertEquals('Period 1 - '+ objBillingSchedule1.formatDate(objBillingSchedule.Start_Date__c)+ ' - '+objBillingSchedule1.formatDate(objBillingSchedule.End_Date__c),BillingSchedulesobj[0].Name);
    }
    static testmethod void TestBillingSchedule2(){

        Asset objAS = [Select Id,Contract__c,Name  From Asset Where Name= 'TestAsset' Limit 1];

        ApexPages.StandardController controller =new ApexPages.StandardController(objAS);
        BillingSchedule objBillingSchedule1 = new BillingSchedule(controller);
        objBillingSchedule1.BindBillingSchedule();
        System.assertEquals('TestAsset',objAS.Name);
    }
}