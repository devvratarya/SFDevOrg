public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String postalCode){
        try{
            Contact[] conts = [SELECT Id,Name FROM Contact WHERE LastName=:lastName AND MailingPostalCode=:postalCode];
            return conts;
        }
        catch(DmlException ex){
            System.debug('error: '+ex.getCause());
            return NULL;
        }
    }
}