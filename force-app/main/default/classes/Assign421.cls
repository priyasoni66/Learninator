public class Assign421 {
    public static void main(){
        List<Case> caseList = [
        	SELECT Id, OwnerId, Priority
            FROM Case
        ];
        
        Map<Id, List<Case>> caseByOwnerIdMap = new Map<Id, List<Case>>();
        Map<String, Integer> totalCasesByPriorityMap = new Map<String, Integer>();
       
        for(Case c : caseList){
            Id ownerId = c.OwnerId;
            String priority = c.Priority;
            
            List<Case> tempCaseList = caseByOwnerIdMap.get(ownerId);
            if(tempCaseList == NULL){
                tempCaseList = new List<Case>();
            }
            tempCaseList.add(c);
            caseByOwnerIdMap.put(ownerId, tempCaseList);
            Integer caseCount = totalCasesByPriorityMap.get(priority);
         
                if(caseCount == NULL){
                    caseCount = 0;
                }
                totalCasesByPriorityMap.put(priority, caseCount + 1);
        }
        System.debug('Cases grouped by OwnerId: ' + caseByOwnerIdMap);
        System.debug('Total number of cases per Priority: ' + totalCasesByPriorityMap);
    }
}