public class Assign430 {
    public static void main(){
        List<Account> accList = [
        	SELECT Id, Rating, Industry,
            (SELECT Id, Name, StageName FROM Opportunities)            
            From Account
        ]; 
        Map<String, List<Account>> accByRatingMap = new Map<String, List<Account>>();
        Map<String, List<Account>> accByIndustryMap = new Map<String, List<Account>>();
        Map<String, List<Opportunity>> oppByStageNameMap = new Map<String, List<Opportunity>>();
        List<Opportunity> closedOpportunities = new List<Opportunity>();
        for(Account acc : accList){
            String industry = acc.Industry;
            String rating = acc.Rating;
            List<Account> tempAccList = accByRatingMap.get(rating);
            List<Account> tempAccList2 = accByIndustryMap.get(industry);
            if(tempAccList == null){
                tempAccList = new List<Account>();
            }
            if(tempAccList2 == null){
                tempAccList2 = new List<Account>();
            }
            tempAccList.add(acc);
            tempAccList2.add(acc);
            accByRatingMap.put(rating, tempAccList);
            accByIndustryMap.put(industry, tempAccList2);
            for(Opportunity opp : acc.Opportunities){
            	String stageName = opp.StageName;
            	List<Opportunity> tempOppList = oppByStageNameMap.get(stageName);
            	if(tempOppList == null){
                	tempOppList = new List<Opportunity>();
            	}
            	tempOppList.add(opp);
            	oppByStageNameMap.put(stageName, tempOppList);
                if(opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost'){
                    closedOpportunities.add(opp);
                }
        	}
        }
        System.debug('Accounts By Rating: ' + accByRatingMap); 
    	System.debug('Accounts By Industry: ' + accByIndustryMap);  
        System.debug('Opportunity by Stage Name: ' + oppByStageNameMap);
    	System.debug('Closed Opportunities: ' + closedOpportunities);
	}	
}