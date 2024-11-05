public class Assign208 {
    public static void main(String leadSource) {
        String leadStatus = 'Closed - Converted';
        List<Lead> convertedLeads = [
            SELECT Id, LeadSource, Status
            FROM Lead
            WHERE Status = :leadStatus
        ];

        Set<Id> opportunityIds = new Set<Id>();
        for (Lead lead : convertedLeads) {
            opportunityIds.add(lead.Id);
        }

        if (opportunityIds.size() > 0) {
            List<Opportunity> highProbOpp = [
                SELECT Id, Name, Probability
                FROM Opportunity
                WHERE Id IN :opportunityIds
                AND Probability > 80
            ];

            if (highProbOpp.size() > 0) {
                System.debug('High probability opportunities from leads with LeadSource "' + leadSource + '":');
                for (Opportunity opp : highProbOpp) {
                    System.debug('Opportunity Name: ' + opp.Name + ' | Probability: ' + opp.Probability);
                }
            } else {
                System.debug('No high-probability opportunities found for LeadSource: ' + leadSource);
            }
        } else {
            System.debug('No converted leads found with LeadSource: ' + leadSource);
        }
    }
}