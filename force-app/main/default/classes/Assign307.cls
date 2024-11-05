public class Assign307 {
    public static void main(){

        List<Account> accounts = [
            SELECT Id, Name,
            (SELECT Id FROM Contacts) 
            FROM Account
            LIMIT 5
        ];
        
		List<Account> accountList = new List<Account>();
        for (Account acc : accounts){
            Integer contactCount = acc.Contacts.size();
            Account accountToUpdate = new Account();
            accountToUpdate.Id = acc.Id;
            accountToUpdate.Number_of_Contacts__c = contactCount;
            accountList.add(accountToUpdate);
        }

        if (accountList.size() > 0) {
            update accountList;
            System.debug('Updated ' + accountList.size() + ' accounts with contact count.');

        } 
    }
}