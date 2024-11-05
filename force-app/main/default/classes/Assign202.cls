public class Assign202 {
    public static void main() {
        List<Contact> contacts = [
            Select Id, Name, Account.Name 
            From Contact 
            Where AccountId IN (
                Select AccountId From Opportunity 
                Where StageName != 'Closed Won'  
                And StageName != 'Closed Lost'
            )
        ];
        for (Contact con : contacts) {
            System.debug('Contact Name: ' + con.Name);
            System.debug('Account Name: ' + con.Account.Name);
        }
    }
}