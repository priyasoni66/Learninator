public class Assign609Handler {
    public static void main(List<Contact> contacts){
        set<Id> accIds = New Set<Id>();
        
        for(Contact con : contacts){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }
        
        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
        
        List<Account> accountList = [
            SELECT Id, 
                   (SELECT Id FROM Contacts),
                   (SELECT Amount FROM Opportunities WHERE IsClosed = TRUE ORDER BY CloseDate DESC LIMIT 1)
            FROM Account
            WHERE Id IN :accIds
        ];
        
        for (Account acc : accountList) {
            acc.Number_of_Contacts__c = acc.Contacts.size();
            
            if (acc.Opportunities.size() > 0) {
                acc.Last_Opportunity_Amount__c = acc.Opportunities[0].Amount;
            } else {
                acc.Last_Opportunity_Amount__c = 0;
            }

            accountsToUpdate.put(acc.Id, acc);
        }

        if (accountsToUpdate.size() > 0) {
            update accountsToUpdate.values();
        }
    }
}