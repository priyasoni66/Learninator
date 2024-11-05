public class Assign434 {
    public static void main(){
        String status = 'Closed';
        List<Case> caseList = [
        	SELECT Id, OwnerId, Status
			FROM Case
            WHERE Status = :status
        ];
        String stageName = 'Closed Won';
        String stageName2 = 'Closed Won';

        List<Opportunity> oppList = [
        	SELECT Id, OwnerId, StageName
            FROM Opportunity
            WHERE StageName = :stageName OR
			StageName = :stageName2 
        ];
        Map<Id, List<Case>> caseByOwnerIdMap = new Map<Id, List<Case>>();
        Map<Id, List<Opportunity>> oppByOwnerIdMap = new Map<Id, List<Opportunity>>();
        for(Case c : caseList){
            Id ownerId = c.OwnerId;
            List<Case> tempCaseList = caseByOwnerIdMap.get(ownerId);
            if(tempCaseList == null){
                tempCaseList = new List<Case>();
            }
            tempCaseList.add(c);
            caseByOwnerIdMap.put(ownerId, tempCaseList);
        }
        System.debug('Case by OwnerId :' + caseByOwnerIdMap);
        for(Opportunity opp : oppList){
            Id ownerId = opp.OwnerId;
            List<Opportunity> tempOppList = oppByOwnerIdMap.get(ownerId);
            if(tempOppList == null){
                tempOppList = new List<Opportunity>();
            }
            tempOppList.add(opp);
            oppByOwnerIdMap.put(ownerId, tempOppList);
        }
        System.debug('Opportunity by OwnerId :' + oppByOwnerIdMap);
        }
    }