public class Assign402 {
    public static void main() {
        List<Contact> contactList = [
            SELECT Id, AccountId, Email
            FROM Contact
            WHERE AccountId != NULL
        ];
        
        Map<Id, List<Contact>> contactByAccountMap = new Map<Id, List<Contact>>();
        
        for (Contact contactObj : contactList) {
            Id accountId = contactObj.AccountId;
            
            List<Contact> tempContactList = contactByAccountMap.get(accountId);
            
            if (tempContactList == null) {
                tempContactList = new List<Contact>();
            }
            
            tempContactList.add(contactObj);
            contactByAccountMap.put(accountId, tempContactList);
        }
        
        System.debug('Contacts grouped by AccountId: ' + contactByAccountMap);
    }
}