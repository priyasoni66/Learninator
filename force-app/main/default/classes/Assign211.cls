public class Assign211 {
    public static void main() {
        List<AggregateResult> accountResults = [
            SELECT AccountId, SUM(Amount) totalAmount
            FROM Opportunity
            GROUP BY AccountId
            HAVING SUM(Amount) > 500000
        ];

        Set<Id> highValueAccountIds = new Set<Id>();
        for (AggregateResult ar : accountResults) {
            highValueAccountIds.add((Id) ar.get('AccountId'));
        }

        if (highValueAccountIds.isEmpty()) {
            System.debug('No Accounts found with total Opportunities greater than $500,000.');
            return;
        }

        List<Contact> contacts = [
            SELECT Id, FirstName, LastName, AccountId
            FROM Contact
            WHERE AccountId IN :highValueAccountIds
        ];

        if (!contacts.isEmpty()) {
            for (Contact con : contacts) {
                System.debug('Contact Name: ' + con.FirstName + ' ' + con.LastName + 
                             ', Account ID: ' + con.AccountId);
            }
        } else {
            System.debug('No Contacts found for the identified high-value Accounts.');
        }
    }
}