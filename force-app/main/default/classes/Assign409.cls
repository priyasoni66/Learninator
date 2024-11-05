public class Assign409 {
    public static void main(){
        List<Opportunity> oppList = [
        	SELECT Id, Name, OwnerId
			From Opportunity   
        ];
        Map<Id, List<Opportunity>> oppByOwnerIdMap = new Map<Id, List<Opportunity>>();
        for(Opportunity opp : oppList){
            Id ownerId = opp.OwnerId;
            if(oppByOwnerIdMap.get(opp.OwnerId) == null){
                oppByOwnerIdMap.put(opp.OwnerId, new List<Opportunity>());
            }
            oppByOwnerIdMap.get(opp.OwnerId).add(opp);
        }        
        System.debug('Opportunity by Owner Id: ' + oppByOwnerIdMap);
    }
}