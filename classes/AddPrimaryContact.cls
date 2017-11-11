public class AddPrimaryContact implements Queueable {

    private Contact c;
    private String state;
    
    public AddPrimaryContact(Contact cont, String st) {
        this.c = cont;
        this.state = st;
    }

    public void execute(QueueableContext context) {
        List<Account> actList = [SELECT ID FROM Account WHERE BillingState=:this.state LIMIT 200];
        List<Contact> contList = new List<Contact>();
        for (Account account : actList) {
            Contact cont = this.c.clone();
            cont.AccountID = account.Id;
            contList.add(cont);
            // perform other processing or callout
        }
        insert contList;
    }

}