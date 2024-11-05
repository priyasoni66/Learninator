public class Assign401 {
    public static void main() {
        List<Account> accList = [
            SELECT Id, Name, (SELECT Id, Email FROM Contacts)
            FROM Account
            WHERE Id IN (SELECT AccountId FROM Contact)
        ];
        
        Map<Id, List<Contact>> accByContactMap = new Map<Id, List<Contact>>();

        for (Account obj : accList) {
            List<Contact> contactList = obj.Contacts;
            if (contactList != null) {
                accByContactMap.put(obj.Id, contactList);
            } 
        }
        System.debug('Contact record for each Account grouped by AccountId: ' + accByContactMap);
    }
}