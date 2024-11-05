public class Assign414 {
    public static void main(){
        List<Contact> conList = [
            SELECT Id, AccountId, Email, LeadSource
            FROM Contact
            WHERE AccountId != NULL
        ];
        Map<Id, List<Contact>> contactByAccountId = new Map<Id, List<Contact>>();
        Map<String, List<Contact>> contactByLeadSource = new Map<String, List<Contact>>();

        for(Contact con : ConList){
            Id accId = con.Id;
            if(contactByAccountId.get(con.Id) == null){
                contactByAccountId.put(con.Id, new List<Contact>());
            }
            contactByAccountId.get(con.Id).add(con);
        }
        for(Contact con : conList){
            String leadSource = con.LeadSource;
            if(contactByLeadSource.get(con.LeadSource) == null){
                contactByLeadSource.put(con.LeadSource, new List<Contact>());
            }
            contactByLeadSource.get(con.LeadSource).add(con);
        }
        System.debug('Contacts by Account Id: ' + contactByAccountId);
    	System.debug('Contacts by Lead Source: ' + contactByLeadSource);
    }
}