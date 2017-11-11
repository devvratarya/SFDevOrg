public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String searchText){
        List<List<sObject>> searchResults = [FIND :searchText IN NAME FIELDS RETURNING Contact(FirstName,LastName,Department),LEAD(FirstName,LastName)];
        return searchResults;
    }
}