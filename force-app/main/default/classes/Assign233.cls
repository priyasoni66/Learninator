public class Assign233{
    public static void main (Id AccountId) {
        List<Contact> contacts = [
			SELECT Name, Email 
			FROM Contact 
			WHERE AccountId = :accountId
		];

        if (contacts.isEmpty()) {
            System.debug('No contacts found for Account ID: ' + accountId);
        } else {
            for (Contact contact : contacts) {
                System.debug('Contact Name: ' + contact.Name);
				System.debug('Email: ' + contact.Email);
            }
        }
    }
}