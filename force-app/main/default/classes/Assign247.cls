public class Assign247 {
    public static void main() {
        List<Contact> ceoContacts = [
            SELECT Id, Name, Title, AccountId 
            FROM Contact 
            WHERE Title = 'CEO'
        ];
        
        Date today = Date.today();
        Date futureDate = today.addDays(60);
        
        List<Opportunity> upcomingOpportunities = [
            SELECT Id, Name, AccountId, CloseDate, Amount 
            FROM Opportunity 
            WHERE CloseDate >= :today AND CloseDate <= :futureDate
        ];
        
        for (Contact con : ceoContacts) {
            for (Opportunity opp : upcomingOpportunities) {
                if (opp.AccountId == con.AccountId) {
                    System.debug('CEO Contact Name: ' + con.Name + 
                                 ', Opportunity Name: ' + opp.Name + 
                                 ', Close Date: ' + opp.CloseDate + 
                                 ', Amount: ' + opp.Amount);
                }
            }
        }
    }
}