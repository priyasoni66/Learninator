trigger Assign510 on Contact (after insert) {
    
    Set<Id> accountIds = new Set<Id>();
    for(Contact con : trigger.New){
        if(con.accountId != NULL){
            accountIds.add(con.accountId);
        }
    }
    
    if(accountIds.size() > 0){
        List<AggregateResult> accountAgrList = [
            SELECT count(Id), AccountId
            FROM Contact
            WHERE AccountId IN :accountIds
            Group By AccountId
        ];
        
        List<Account> accountsToUpdate = new List<Account>();
        
        for(AggregateResult agr: accountAgrList){
            Account accObj = new Account();
            accObj.Id = ''+ agr.get('AccountId');
            accObj.Number_Of_Contacts__c = Decimal.valueOf(''+ agr.get('expr0'));
            accountsToUpdate.add(accObj);
        }
        
        UPDATE accountsToUpdate;
    }
}