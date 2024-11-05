public class Assign413 {
    public static void main(){
    	List<Opportunity> oppList = [
        	SELECT Id, Name, AccountId, OwnerId 
            FROM Opportunity
        ];    
        Map<Id, List<Opportunity>> oppByAccountMap = new Map<Id, List<Opportunity>>();
		Map<Id, List<Opportunity>> oppByOwnerIdMap = new Map<Id, List<Opportunity>>();
        for(Opportunity opp : oppList){
            Id accountId = opp.AccountId;
            List<Opportunity> tempOppList = oppByAccountMap.get(accountId);
            if(tempOppList == NULL){
                tempOppList = new List<Opportunity>();
            }
            tempOppList.add(opp);
            oppByAccountMap.put(accountId, tempOppList);             
        }
        
        for(Opportunity opp : oppList){
            Id ownerId = opp.OwnerId;
            List<Opportunity> tempOppList2 = oppByOwnerIdMap.get(ownerId);
            if(tempOppList2 == NULL){
                tempOppList2 = new List<Opportunity>();
            }
            tempOppList2.add(opp);
            oppByOwnerIdMap.put(ownerId, tempOppList2);
        }
        
        System.debug('Opportunities grouped by AccountId: ' + oppByAccountMap);
        System.debug('Opportunities grouped by Owner Id: ' + oppByOwnerIdMap);
   		}
   }