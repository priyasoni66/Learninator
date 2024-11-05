public class Assign301 {
	public static void main() {
        List<Account> accountsWithoutContacts = [
            SELECT Id, Name 
            FROM Account 
            WHERE Id NOT IN (
                SELECT AccountId 
                FROM Contact
            )
        ];
        
        List<Contact> contactList = new List<Contact>();
        
        for (Account acc : accountsWithoutContacts) {
            Contact newContact = new Contact();
            newContact.FirstName = 'John';
            newContact.LastName = 'Doe'; 
            newContact.AccountId = acc.Id; 
            contactList.add(newContact);
        }
        if (contactList.size() > 0) {
            insert contactList;
            System.debug('Inserted ' + contactList.size() + ' contacts for accounts without contacts.');
        }
    }
}