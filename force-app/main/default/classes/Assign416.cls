public class Assign416 {
    public static void main(){
        List<Case> caseList = [
        	SELECT CaseNumber, Priority, OwnerId
			FROM Case     
        ];
        Map<String, List<Case>> caseByPriorityMap = new Map<String, List<Case>>();
        Map<Id, List<Case>> caseByOwnerIdMap = new Map<Id, List<Case>>();
        for(Case c : caseList){
            String priority = c.Priority;
           	List<Case> tempCaseList = caseByPriorityMap.get(priority);

            if(tempCaseList == null){
                tempCaseList = new List<Case>();
            }
            tempCaseList.add(c);
            caseByPriorityMap.put(priority, tempCaseList);
        }
        for(Case c : caseList){
           	Id ownerId = c.OwnerId;
           	List<Case> tempCaseList = caseByOwnerIdMap.get(ownerId);

            if(tempCaseList == null){
                tempCaseList = new List<Case>();
            }
            tempCaseList.add(c);
            caseByOwnerIdMap.put(ownerId, tempCaseList);
        }
        System.debug('Case by Priority: ' + caseByPriorityMap);
        System.debug('Case bu OwnerId: ' + caseByOwnerIdMap);
    }
}