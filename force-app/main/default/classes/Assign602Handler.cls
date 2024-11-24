public class Assign602Handler {
    
    public static void main(List<Opportunity> opportunities){
        
    Map<Id, Account> accountMap = new Map<Id, Account>();

        for(Opportunity opp : opportunities){
            if(opp.AccountId != null){
                accountMap.put(opp.AccountId, null);
            }
        }
        
        if(accountMap.size() > 0){
            accountMap.putAll([
                SELECT Id, Total_Opportunity_Amount__c 
                FROM Account 
                WHERE Id IN :accountMap.keySet()
            ]);
        }
        
        
        for(Opportunity opp : opportunities){
            if(opp.AccountId != null && accountMap.containsKey(opp.AccountId)){
                Account acc = accountMap.get(opp.AccountId);
                if(acc != null){
                    acc.Total_Opportunity_Amount__c = opp.Amount;
                }
            }
        }
        
        if(accountMap.size() > 0){
            update accountMap.values();
        } 
    }
}