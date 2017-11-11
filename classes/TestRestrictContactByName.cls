@isTest
private class TestRestrictContactByName {
    @isTest static void testTestrictContact(){
        // Add a contact to this account.
        Contact con = new Contact(
            FirstName='Carol',
            LastName='Ruiz',
            Phone='(415)555-1212',
            Department='Wingo');
        insert con;
            System.debug('new cont id: '+con.Id);
        con.LastName='INVALIDNAME';
        update con;
            System.debug('updated cont id: '+con.Id);
    }
}