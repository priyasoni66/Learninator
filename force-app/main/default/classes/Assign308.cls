public class Assign308 {
    public static void main() {
        List<Lead> leadsToUpdate = new List<Lead>();
        List<Lead> leadList = [
            SELECT Id, Email 
            FROM Lead
        ];

        Set<String> leadEmails = new Set<String>();
        for (Lead lead : leadList) {
            leadEmails.add(lead.Email);
        }
        

        List<Contact> matchingContacts = [
            SELECT Id, Email
            FROM Contact
            WHERE Email IN :leadEmails
        ];

        for (Lead lead : leadList) {
            for (Contact contact : matchingContacts) {
                if (contact.Email == lead.Email) {
                    lead.Possible_Duplicate__c = true;
                    leadsToUpdate.add(lead);
                    break;  
                }
            }
        }

        if (leadsToUpdate.size() > 0) {
            update leadsToUpdate;
            System.debug('Updated ' + leadsToUpdate.size() + ' leads with possible duplicates.');
        }
    }
}