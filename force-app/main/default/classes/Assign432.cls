public class Assign432 {
    public static void main(){
        List<Contact> conList = [
        	SELECT Id, AccountId, (SELECT CaseNumber, Status 
			FROM Cases)
            FROM Contact
        ];
        Map<Id, List<Contact>> conByAccountIdMap = new Map<Id, List<Contact>>();
        Map<Id, List<Case>> caseByAccountIdMap = new Map<Id, List<Case>>();
        List<Case> openCasesList = new List<Case>();
        for(Contact con : conList){
            Id accountId = con.AccountId;
            List<Contact> tempConList = conByAccountIdMap.get(accountId);
            if(tempConList == null){ 
                tempConList = new List<Contact>();
            }
           	tempConList.add(con);
           	conByAccountIdMap.put(accountId, tempConList);
        	for(Case c : con.Cases){
            	List<Case> tempCaseList = caseByAccountIdMap.get(accountId);
            	if(tempCaseList == null){
                	tempCaseList = new List<Case>();
            	}
           		tempCaseList.add(c);
           		caseByAccountIdMap.put(accountId, tempCaseList);
                if(c.Status != 'Closed'){
                    openCasesList.add(c);
                }
            }
        }
        System.debug('Contact By Account Id: ' + conByAccountIdMap); 
    	System.debug('Case By Account Id: ' + caseByAccountIdMap);  
    	System.debug('Open Cases: ' + openCasesList);                
    }
}