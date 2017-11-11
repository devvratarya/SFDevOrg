public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numOfContacts, String lastName){
        List<Contact> contList = new List<Contact>();
        for(Integer i=0;i<numOfContacts;i++) {
            Contact c = new Contact(FirstName='Test' + i, LastName=lastName);
            contList.add(c);
        }

        return contList;
    }
}