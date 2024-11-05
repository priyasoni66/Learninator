public class Assign425 {
    public static void main(){
        List<Account> accList = [
            Select Id, (Select AccountId From Contacts), 
			(Select AccountId, ContactId, Priority, OwnerId From Cases)
			From Account
        ];
        Map<String, List<Case>> caseByPriorityMap = new Map<String, List<Case>>();
        Map<Id, List<Case>> caseByOwnerIdMap = new Map<Id, List<Case>>();
        List<Contact> relConAndCases = new List<Contact>();
        for(Account acc : accList){
            for(Case c : acc.Cases){
                String priority = c.Priority;
                Id ownerId = c.OwnerId;
                List<Case> tempCaseList = caseByPriorityMap.get(priority);
                if(tempCaseList == NULL){
                    tempCaseList = new List<Case>();
                }
                tempCaseList.add(c);
                caseByPriorityMap.put(priority, tempCaseList);
                
                List<Case> tempCaseList2 = caseByOwnerIdMap.get(ownerId);
                if(tempCaseList2 == NULL){
                    tempCaseList2 = new List<Case>();
                }
                tempCaseList2.add(c);
                caseByOwnerIdMap.put(ownerId, tempCaseList2);
                for(Contact con : acc.Contacts)
                    if(con.Id == c.ContactId){
                        relConAndCases.add(con);
                    }
            }
        }
        System.debug('Case by Priority: ' + caseByPriorityMap);
        System.debug('Case by OwnerId: ' + caseByOwnerIdMap);
        System.debug('Contacts for Accounts related to Cases: ' + relConAndCases);
    }
}