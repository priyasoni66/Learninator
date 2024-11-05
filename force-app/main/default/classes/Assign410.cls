public class Assign410 {
    public static void main() {
        List<Account> accountList = [
            SELECT Name, Region__c, AnnualRevenue 
            FROM Account
        ];

        Map<String, List<Account>> accountsByRegionMap = new Map<String, List<Account>>();
        Map<String, Decimal> revenueByRegionMap = new Map<String, Decimal>();
		
       	String highestRevenueRegion = null;
        Decimal maxRevenue = 0;
        
        for (Account acc : accountList) {
            String region = acc.Region__c;
            List<Account> tempAccountList = accountsByRegionMap.get(region);
                
            if (tempAccountList == null) {
                tempAccountList = new List<Account>();
            }
            tempAccountList.add(acc);
            accountsByRegionMap.put(region, tempAccountList);
                   
        	Decimal totalRevenue = revenueByRegionMap.get(region);
            if (totalRevenue == null) {
                totalRevenue = 0;
            }
            if (acc.AnnualRevenue != null) {
                totalRevenue = totalRevenue + acc.AnnualRevenue;
            }
            revenueByRegionMap.put(region, totalRevenue);

            if (totalRevenue > maxRevenue) {
                maxRevenue = totalRevenue;
                highestRevenueRegion = region;
            }
        }

        System.debug('Accounts by Region: ' + accountsByRegionMap);
        System.debug('Revenue by Region: ' + revenueByRegionMap);
        System.debug('Region with the highest Annual Revenue: ' + highestRevenueRegion + ', Revenue: ' + maxRevenue);
    }
}