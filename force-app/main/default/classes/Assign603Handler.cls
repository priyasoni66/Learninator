public class Assign603Handler {
    
    public static void main(List<Contact> contacts) {
        
        Map<Id, Account> accountMap = new Map<Id, Account>();
        
        for (Contact con : contacts) {
            if (con.AccountId != null) {
                accountMap.put(con.AccountId, null);  
            }
        }        
        if (accountMap.size() > 0) {
            accountMap.putAll([
                SELECT Id, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry
                FROM Account
                WHERE Id IN :accountMap.keySet()
            ]);
        }

        for (Contact con : contacts) {
            if (con.AccountId != null && accountMap.containsKey(con.AccountId)) {
                Account acc = accountMap.get(con.AccountId);
                if (acc != null) {
                    con.MailingStreet = acc.BillingStreet;
                    con.MailingCity = acc.BillingCity;
                    con.MailingState = acc.BillingState;
                    con.MailingPostalCode = acc.BillingPostalCode;
                    con.MailingCountry = acc.BillingCountry;
                }
            }
        }
    }
}