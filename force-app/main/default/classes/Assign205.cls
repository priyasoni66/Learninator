public class Assign205 {
    public void execute() {
        List<AggregateResult> leadResults = [
            SELECT OwnerId, COUNT(Id) leadCount
            FROM Lead
            WHERE IsConverted = true
            GROUP BY OwnerId
        ];

        List<AggregateResult> opportunityResults = [
            SELECT OwnerId, COUNT(Id) opportunityCount
            FROM Opportunity
            WHERE StageName = 'Closed Won'
            GROUP BY OwnerId
        ];
 
        List<String> comparisonResults = new List<String>();

        if (leadResults.size() < 0) {
            System.debug('No converted leads found.');
        } else {
            for (AggregateResult leadResult : leadResults) {
                Id userId = (Id) leadResult.get('OwnerId');
                Integer leadsConverted = (Integer) leadResult.get('leadCount');
                Integer opportunitiesWon = 0;

                for (AggregateResult oppResult : opportunityResults) {
                    if ((Id) oppResult.get('OwnerId') == userId) {
                        opportunitiesWon = (Integer) oppResult.get('opportunityCount');
                        break;
                    }
                }

                comparisonResults.add('User ID: ' + userId + 
                                      ', Leads Converted: ' + leadsConverted + 
                                      ', Opportunities Won: ' + opportunitiesWon);
            }
        }
        if (comparisonResults.size() < 0) {
            System.debug('No comparison results to display.');
        } else {
            for (String result : comparisonResults) {
                System.debug(result);
            }
        }
    }
}