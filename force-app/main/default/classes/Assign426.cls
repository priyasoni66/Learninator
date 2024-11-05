public class Assign426 {
    public static void main(){
        List<Lead> leadList = [
        	SELECT Id, Status, OwnerId
			FROM Lead    
        ];
        Map<String, List<Lead>> leadByStatusMap = new Map<String, List<Lead>>();
        Map<Id, List<Lead>> leadByOwnerIdMap = new Map<Id, List<Lead>>();
        List<Lead> convertedLeads = new List<Lead>();
        for(Lead l : leadList){
        	String status = l.Status;
            Id ownerId = l.OwnerId;
            List<Lead> tempLeadList = leadByStatusMap.get(status);
            List<Lead> tempLeadList2 = leadByOwnerIdMap.get(ownerId);
            if(tempLeadList == NULL){
                tempLeadList = new List<Lead>();
            }
            if(status == 'Closed - Converted'){
                convertedLeads.add(l);
            }
            tempLeadList.add(l);
            leadByStatusMap.put(status, tempLeadList);
            if(tempLeadList2 == NULL){
                tempLeadList2 = new List<Lead>();
            }
            tempLeadList2.add(l);
            leadByOwnerIdMap.put(ownerId, tempLeadList2);
        }
        System.debug('Lead by Satus: ' + leadByStatusMap);
        System.debug('Lead by OwnerId: ' + leadByOwnerIdMap);
        System.debug('Converted Leads: ' + convertedLeads);
    }
}