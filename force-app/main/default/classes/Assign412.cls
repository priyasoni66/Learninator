public class Assign412 {
    public static void main(){
        List<Account> accList = [
        	SELECT Id, Industry, Region__c
			FROM Account    
        ];
        
        Map<String, List<Account>> accByIndustryMap = new Map<String, List<Account>>();
     	Map<String, List<Account>> accByRegionMap = new Map<String, List<Account>>();
        for(Account acc : accList){
            String industry = acc.Industry;
            List<Account> tempAccountList = accByIndustryMap.get(industry);
            if(tempAccountList == null){
                tempAccountList = new List<Account>();
            }
            tempAccountList.add(acc);
            accByIndustryMap.put(industry, tempAccountList);
        }
        for(Account acc : accList){
            String region = acc.Region__c;
            List<Account> tempAccountList = accByRegionMap.get(region);
            if(tempAccountList == null){
                tempAccountList = new List<Account>();
            }
            tempAccountList.add(acc);
            accByRegionMap.put(region, tempAccountList);
        }
        System.debug('Account by Industry: ' + accByIndustryMap);
    	System.debug('Account by Region: ' + accByRegionMap);
    }
}