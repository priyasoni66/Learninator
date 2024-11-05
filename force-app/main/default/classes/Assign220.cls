public class Assign220 {
    
    public static void main() {
        List<Account> accountsWithContacts = [ 
            SELECT Id, Name, (SELECT Id, Phone FROM Contacts WHERE Phone != null)
            FROM Account
            WHERE Id IN (SELECT AccountId FROM Contact WHERE Phone != null)
        ];
        
        for (Account acc : accountsWithContacts) {
            Set<String> uniquePhones = new Set<String>(); 
            
            for (Contact con : acc.Contacts) {
                uniquePhones.add(con.Phone);
            }
            
            if (uniquePhones.size() >= 2) {
                System.debug('Account: ' + acc.Name + ' Contacts with different Phone numbers.' + uniquePhones);
            }
        }
    }
}