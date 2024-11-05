public class Assign433 {
    public static void main(){
     	List<Account> accList = [
        	SELECT Id, Name, Industry, (SELECT Id, Name, StageName 
			FROM Opportunities)
            FROM Account
        ];   
        Map<String, List<Account>> accByIndustryMap = new Map<String, List<Account>>();
        Map<String, List<Opportunity>> oppByStageNameMap = new Map<String, List<Opportunity>>();
        List<Account> accountsWithoutOpportunities = new List<Account>();
        for(Account acc : accList){
            String industry = acc.Industry;
            List<Account> tempAccList = accByIndustryMap.get(industry);
            if(tempAccList == null){
                tempAccList = new List<Account>();
            }
            tempAccList.add(acc);
            accByIndustryMap.put(industry, tempAccList);
        	if (acc.Opportunities.isEmpty()) {
                accountsWithoutOpportunities.add(acc);
        	} else {
        		for(Opportunity opp : acc.Opportunities){
            	String stageName = opp.StageName;
            	List<Opportunity> tempOppList = oppByStageNameMap.get(stageName);
            	if(tempOppList == null){
                	tempOppList = new List<Opportunity>();
            	}
            	tempOppList.add(opp);
            	oppByStageNameMap.put(stageName, tempOppList);
        	}
        }
    }
    System.debug('Account By Industry: ' + accByIndustryMap); 
    System.debug('Opportunity By StageName: ' + oppByStageNameMap);  
    System.debug('Accounts with no Opportunities: ' + accountsWithoutOpportunities);
    }
}