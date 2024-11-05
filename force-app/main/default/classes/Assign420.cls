public class Assign420 {
    public static void main(){
        List<Account> accList = [
        	SELECT Id, Type
			FROM Account    
        ];
        List<Contact> conList = [
        	SELECT Id, AccountId
            FROM Contact
        ];
        Map<String, List<Account>> accByTypeMap = new Map<String, List<Account>>(); 
        Map<Id, List<Contact>> conByAccountIdMap = new Map<Id, List<Contact>>();
        for(Account acc : accList){
            String type = acc.Type;
            List<Account> tempAccList = accByTypeMap.get(type);
            if(tempAccList == null){
                tempAccList = new List<Account>();
            }
            tempAccList.add(acc);
            accByTypeMap.put(type, tempAccList);
        }
        System.debug('Account By Type : ' + accByTypeMap);
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