public class AccountHandler {
    public static Account insertNewAccount(String actName){
        try{
            Account act = new Account(Name=actName);
            insert act;
            return act;
        }
        catch(DmlException e){
            System.debug('Account could not be inserted. Given Account Name: ' + actName);
            return null;
        }
    }
}