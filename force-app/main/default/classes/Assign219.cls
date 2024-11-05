public class Assign219 {
    public static void main() {
        Datetime cutoffDateTime = Datetime.now().addDays(-60);

        List<Opportunity> staleOpportunities = [
            SELECT Id, Name, AccountId, Account.Name, LastModifiedDate, StageName
            FROM Opportunity
            WHERE LastModifiedDate < :cutoffDateTime
            AND StageName NOT IN ('Closed Won', 'Closed Lost')
        ];

        for (Opportunity opp : staleOpportunities) {
            System.debug('Account: ' + opp.Account.Name);
			System.debug('Opportunity: ' + opp.Name);
            System.debug('Last Modified: ' + opp.LastModifiedDate);
			System.debug('Stage: ' + opp.StageName);
        }
    }
}