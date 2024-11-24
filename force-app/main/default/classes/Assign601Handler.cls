public class Assign601Handler {
    public static void main(List<Contact> contacts) {
        Set<Id> accountIds = new Set<Id>();
        
        for (Contact contact : contacts) {
            if (contact.AccountId != null) {
                accountIds.add(contact.AccountId);
            }
        }

        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
        
        List<Account> accountList = [
            SELECT Id, (SELECT Id FROM Contacts)
            FROM Account
            WHERE Id IN :accountIds
        ];
        
        for (Account acc : accountList) {
            acc.Number_of_Contacts__c = acc.Contacts.size();
            accountsToUpdate.put(acc.Id, acc);
        }
        
        
        if (accountsToUpdate.size() > 0) {
            update accountsToUpdate.values();
        }
    }
}