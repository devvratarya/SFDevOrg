trigger InsertContactOnAccountUpsert on Account (after insert, after update) {
    if(Trigger.isInsert)
    {
        List<Contact> ct = new List <Contact>();
        for (Account acc: Trigger.New)
        {
            //  Insert a contact on account insert with mapping
            // You can add the logic here to check if acount create contact is true or not
                 ct.add (new Contact(
                         FirstName = 'Account',
                         LastName = 'Last Name',
                         Email = 'Account@email.com',
                         AccountId = acc.id,
                         Fax=acc.Fax,
                         MailingStreet=acc.BillingStreet,
                         MailingCity=acc.BillingCity,
                         MailingState=acc.BillingState,
                         MailingPostalCode=acc.BillingPostalCode,
                         MailingCountry=acc.BillingCountry,
                         Phone=acc.Phone
                         )
                     );   
            
        }
        if(!ct.isEmpty())
            insert ct; 
    }
}