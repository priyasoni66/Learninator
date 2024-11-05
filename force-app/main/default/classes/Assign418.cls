public class Assign418 {
    public static void main(){
        List<Lead> leadList = [
        	SELECT Id, Status, OwnerId
			FROM Lead 	   
        ];
        Map<String, List<Lead>> leadByStatusMap = new Map<String, List<Lead>>();
       	Map<Id, List<Lead>> leadByOwnerIdMap = new Map<Id, List<Lead>>();
        for(Lead l : leadList){
        	String status = l.Status;
            List<Lead> tempLeadList = leadByStatusMap.get(status);
            if(tempLeadList == null){
                tempLeadList = new List<Lead>();
            }
            tempLeadList.add(l);
            leadByStatusMap.put(status, tempLeadList);
        }
        System.debug('Lead By Status : ' + leadByStatusMap);
        for(Lead l : leadList){
        	Id ownerId = l.OwnerId;
            List<Lead> tempLeadList = leadByOwnerIdMap.get(ownerId);
            if(tempLeadList == null){
                tempLeadList = new List<Lead>();
            }
            tempLeadList.add(l);
            leadByOwnerIdMap.put(ownerId, tempLeadList);
        }
        System.debug('Lead By Id : ' + leadByOwnerIdMap);
    }
}