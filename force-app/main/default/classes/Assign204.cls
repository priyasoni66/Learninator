public class Assign204 {

    public static void main() {
        Date startOfYear = Date.newInstance(Date.today().year(), 1, 1);
        Date endOfYear = Date.newInstance(Date.today().year(), 12, 31);
        
        List<Account> accountsWithContacts = [
            SELECT Id, Name, 
                (SELECT Id FROM Contacts), 
                (SELECT Id FROM Opportunities WHERE CloseDate >= :startOfYear AND CloseDate <= :endOfYear)
            FROM Account
        ];
        
        for (Account acc : accountsWithContacts) {
            Integer contactCount = acc.Contacts.size();  
            Integer opportunityCount = acc.Opportunities.size();           
            if (contactCount > 5 && opportunityCount == 0) {
                System.debug('Account Name: ' + acc.Name + ' has more than 5 contacts but no opportunities this year.');
            }
        }
    }
}