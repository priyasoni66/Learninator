public class Assign403 {
    public static void main(){
        List<Opportunity> oppList = [
        	SELECT Id, Name, AccountId
			FROM Opportunity 
			WHERE AccountId != NULL   
        ];
        
        Map<Id, List<Opportunity>> oppByAccountMap = new Map<Id, List<Opportunity>>();
        for(Opportunity obj : oppList){
        	Id accountId = obj.AccountId;
            List<Opportunity> tempOppList = oppByAccountMap.get(accountId);
            if(tempOppList == NULL){
                tempOppList = new List<Opportunity>();
            }
            tempOppList.add(obj);
            oppByAccountMap.put(accountId, tempOppList);             
        }
        System.debug('Opportunities grouped by AccountId: ' + oppByAccountMap);
    }
}