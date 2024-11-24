public class Assign605Handler {

    public static void main(List<Contact> contacts){
        
        Map<Id, Account> accountMap = new Map<Id, Account>();
        for(Contact con : contacts){
            if(con.AccountId != null){
                accountMap.put(con.AccountId, null);
            }
        }
        
        if(accountMap.size() > 0){
            accountMap.putAll([
                SELECT Id, Type
                FROM Account
                WHERE Id IN :accountMap.keySet()
            ]);
        }
        
         for(Contact con : contacts) {
            if(con.AccountId != null && accountMap.containsKey(con.AccountId)) {
                Account acc = accountMap.get(con.AccountId);
                if(acc != null) {
                    con.Account_Type__c = acc.Type; 
                }
            }
        }
        if(accountMap.size() > 0){
            update accountMap.values();
        }
    }
}