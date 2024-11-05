public class Assign404 {
    public static void main(){
        List<Account> accList = [
        	SELECT Id, AnnualRevenue
			FROM Account    
        ];
        
        Map<Id, Decimal> accountRevenueMap = new Map<Id, Decimal>();
        
        Id highestRevenueAccountId = null;
        Decimal highestRevenue = 0;
        
        for (Account acc : accList) {
            accountRevenueMap.put(acc.Id, acc.AnnualRevenue);

            if (acc.AnnualRevenue != null)
                if(acc.AnnualRevenue > highestRevenue) {
                	highestRevenue = acc.AnnualRevenue;
                	highestRevenueAccountId = acc.Id;
            }
        }
        System.debug('Account with the highest revenue: ' + highestRevenueAccountId);
        System.debug('Revenue: ' + highestRevenue);
    }
}