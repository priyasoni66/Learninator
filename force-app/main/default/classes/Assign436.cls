public class Assign436 {
    public static void main(){
       
        List<Account> accList = [
        	SELECT Id, AnnualRevenue, (SELECT Id, AccountId 
			FROM Contacts) 
            FROM Account
        ];
        
        Map<Id, List<Contact>> conByAccIdMap = new Map<Id, List<Contact>>();
        Map<Decimal, List<Account>> accByAnnualRevMap = new Map<Decimal, List<Account>>();
        List<Account> highRevenueAccounts = new List<Account>();
        Decimal highRevenueThreshold = 1000000;
        
        for(Account acc : accList){
            Decimal annualRevenue = acc.AnnualRevenue;
            List<Account> tempAccList = accByAnnualRevMap.get(annualRevenue);
            if(tempAccList == null){
                tempAccList = new List<Account>();
            }
            if (annualRevenue >= highRevenueThreshold) {
                highRevenueAccounts.add(acc);
            }
            tempAccList.add(acc);
            accByAnnualRevMap.put(annualRevenue, tempAccList);
            for(Contact con : acc.Contacts){
                Id accountId = con.AccountId;
                List<Contact> tempConList = conByAccIdMap.get(accountId);
                if(tempConList == null){
                    tempConList = new List<Contact>();
                }
                tempConList.add(con);
                conByAccIdMap.put(accountId, tempConList);
            }
        }
        System.debug('Account by AnnualRevenue: ' + accByAnnualRevMap);
        System.debug('Contact by Account Id: ' + conByAccIdMap);
        System.debug('High Revenue Accounts: ' + highRevenueAccounts);
    }
}