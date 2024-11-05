public class Assign411 {
    public static void main(){
        List<Contact> conList = [
        	SELECT Id, AccountId
            FROM Contact
            WHERE AccountId != Null
        ];
        
        Map<Id, List<Contact>> contactByAccountMap = new Map<Id, List<Contact>>();
        for(Contact con : conList){
            Id accountId = con.AccountId;
            
            List<Contact> tempContList = contactByAccountMap.get(accountId);
            if(tempContList == Null){
                tempContList = new List<Contact>();
            }
            tempContList.add(con);
            contactbyAccountMap.put(accountId, tempContList);
        }
            Id maxAccountId = null;
        	Integer maxContactCount = 0;
        
        	for(Id accountId : contactByAccountMap.keySet()){
            Integer contactCount = contactByAccountMap.get(accountId).size();
            if(contactCount > maxContactCount){
                maxContactCount = contactCount;
                maxAccountId = accountId;
            }
        }
             System.debug('Account with the most contacts: ' + maxAccountId);
        System.debug('Number of contacts: ' + maxContactCount);
            
        }
    }