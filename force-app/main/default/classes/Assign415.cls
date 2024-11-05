public class Assign415 {
    public static void main(){
    	List<Account> accList = [
            SELECT Id, Industry, AnnualRevenue
            FROM Account
        ];    
    
    	Map<String, List<Account>> accByIndustryMap = new Map<String, List<Account>>();
        Map<String, Decimal> totalAnnualRevenueMap = new Map<String, Decimal>();
        for (Account acc : accList) {
            
            String industry = acc.Industry;
           
            if (accByIndustryMap.get(acc.Industry) == null) {
                accByIndustryMap.put(acc.Industry, new List<Account>());
            }
            accByIndustryMap.get(acc.Industry).add(acc);
            Decimal totalAnnualRev = totalAnnualRevenueMap.get(industry);
            if (totalAnnualRev == null) {
                totalAnnualRev = 0;
            }
            if (acc.AnnualRevenue != null) {
                totalAnnualRev = totalAnnualRev + acc.AnnualRevenue;
            }    
            totalAnnualRevenueMap.put(industry, totalAnnualRev);
        }
        System.debug('Accounts grouped by Industry: ' + accByIndustryMap);
        System.debug('Total Annual Revenue by Industry: ' + totalAnnualRevenueMap);
	}
}