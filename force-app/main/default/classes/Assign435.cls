public class Assign435 {
    public static void main(){
    Date dateCal = Date.today().addDays(30);
    	List<Account> accList = [
        	SELECT Id, Name, BillingCountry,
            (SELECT Id, Name, CloseDate FROM Opportunities)
            FROM Account   
        ];   
        
        Map<String, List<Account>> accByBillingCountryMap = new Map<String, List<Account>>();
        Map<Date, List<Opportunity>> oppByCloseDateMap = new Map<Date, List<Opportunity>>();
        List<Opportunity> closingOpp = new List<Opportunity>();

        for(Account acc : accList){
            String billingCountry = acc.BillingCountry;
            List<Account> tempAccList = accByBillingCountryMap.get(billingCountry);
            if(tempAccList == null){
                tempAccList = new List<Account>();
            }
            tempAccList.add(acc);
            accByBillingCountryMap.put(billingCountry, tempAccList);
        
            for(Opportunity opp : acc.Opportunities){
                Date closeDate = opp.CloseDate;
                List<Opportunity> tempOppList = oppByCloseDateMap.get(closeDate);
                if(tempOppList == null){
                    tempOppList = new List<Opportunity>();
                }
                tempOppList.add(opp);
                oppByCloseDateMap.put(closeDate, tempOppList);
            
            	if(closeDate <= dateCal){
                	closingOpp.add(opp);
            	}
            }
        }
        System.debug('Account By Billing Country: ' + accByBillingCountryMap);
        System.debug('Account By Billing Country: ' + oppByCloseDateMap);
        System.debug('Closing opp within 30 days: ' + closingOpp);
    }
}