public class Assign232 {
    public static void main() {
            List<Account> accountsWithOpp = [
            SELECT Id, Name, (SELECT Id FROM Opportunities) 
            FROM Account 
            WHERE Id IN (SELECT AccountId FROM Opportunity)
        ];
        
        for (Account acc : accountsWithOpp) {
            Integer opportunityCount = acc.Opportunities.size();
            System.debug('Account Name: ' + acc.Name);
			System.debug('Opportunity Count: ' + opportunityCount);
        }
    }
}