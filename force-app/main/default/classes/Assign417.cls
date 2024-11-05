public class Assign417 {
    public static void main(){
    	List<Account> accList = [
            SELECT Id, Rating, AnnualRevenue
            FROM Account
        ];    
    
    	Map<String, List<Account>> accByRatingMap = new Map<String, List<Account>>();
        Map<Id, Decimal> totalAnnualRevenueMap = new Map<Id, Decimal>();
        for (Account acc : accList) {
            
            String rating = acc.Rating;
            Id accountId = acc.Id;
           
            if (accByRatingMap.get(acc.rating) == null) {
                accByRatingMap.put(acc.rating, new List<Account>());
            }
            accByRatingMap.get(acc.Rating).add(acc);
            Decimal totalAnnualRev = totalAnnualRevenueMap.get(accountId);
            if (totalAnnualRev == null) {
                totalAnnualRev = 0;
            }
            if (acc.AnnualRevenue != null) {
                totalAnnualRev = totalAnnualRev + acc.AnnualRevenue;
            }    
            totalAnnualRevenueMap.put(accountId, totalAnnualRev);
                        	
        }
        System.debug('Accounts grouped by Rating: ' + accByRatingMap);
        System.debug('Total Annual Revenue by AccountId: ' + totalAnnualRevenueMap);
	}
}