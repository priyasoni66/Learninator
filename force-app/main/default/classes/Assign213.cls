public class Assign213 {
    public static void main() {
        List<Contact> contactsWithoutOpportunities = [
            Select Id, Name 
            From Contact 
            Where Id Not In (Select ContactId From OpportunityContactRole)
        ];
        for (Contact contact : contactsWithoutOpportunities) {
            System.debug('Contact Name: ' + contact.Name + ', Contact Id: ' + contact.Id);
        }
    }
}