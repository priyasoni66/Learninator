public class Assign428 {
    public static void main(){
        List<Account> accList = [
        	SELECT Id, AnnualRevenue, Region__c, (SELECT Id, AccountId 
            FROM Contacts) 
            FROM Account
            WHERE Region__c != NULL
        ];
        Map<String, List<Account>> accByRegionMap = new Map<String, List<Account>>();
        Map<String, List<Contact>> conByRegionMap = new Map<String, List<Contact>>();
        List<Account> annRevList = new List<Account>();
        Decimal highRevThreshold = 1000000;
        for(Account acc : accList){
            Decimal annualRev = acc.AnnualRevenue;
            String region = acc.Region__c;
            List<Account> tempAccList = accByRegionMap.get(region);
            if(tempAccList == null){
            	tempAccList = new List<Account>();
            }
            if(annualRev >= highRevThreshold){
				annRevList.add(acc);                   
            }
            tempAccList.add(acc);
            accByRegionMap.put(region, tempAccList);
            for(Contact con : acc.Contacts){
            	List<Contact> tempConList = conByRegionMap.get(region);
            	if(tempConList == null){
            		tempConList = new List<Contact>();
            	}
            	tempConList.add(con);
            	conByRegionMap.put(region, tempConList);
       		}
       	}
    	System.debug('Account by Region: ' + accByRegionMap);
    	System.debug('Contact by Region: ' + conByRegionMap);
     	System.debug('High Annual Revenue: ' + annRevList);    
	}
}