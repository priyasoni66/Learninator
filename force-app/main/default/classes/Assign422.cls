public class Assign422 {
    public static void main(){
        List<Account> accList = [
        	SELECT Id, Industry
			FROM Account    
        ];
        List<Contact> conList = [
        	SELECT Id, AccountId
            FROM Contact
        ];
        Map<String, List<Account>> accByIndustryMap = new Map<String, List<Account>>(); 
        Map<Id, List<Contact>> conByAccountIdMap = new Map<Id, List<Contact>>();
        for(Account acc : accList){
            String industry = acc.Industry;
            List<Account> tempAccList = accByIndustryMap.get(Industry);
            if(tempAccList == null){
                tempAccList = new List<Account>();
            }
            tempAccList.add(acc);
            accByIndustryMap.put(industry, tempAccList);
        }
        System.debug('Account By Industry : ' + accByIndustryMap);
        for(Contact con : conList){
            Id accountId = con.AccountId;
            List<Contact> tempConList = conByAccountIdMap.get(accountId);
            if(tempConList == null){
                tempConList = new List<Contact>();
            }
            tempConList.add(con);
            conByAccountIdMap.put(accountId, tempConList);
        }
        System.debug('Contact By Account Id : ' + conByAccountIdMap);
    }
}