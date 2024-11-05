public class LeadOpportunityComparison {
    public void compareLeadsAndOpportunities() {
        // Create a map to store User IDs and their corresponding Lead and Opportunity counts
        Map<Id, UserLeadOpportunityData> userLeadOpportunityMap = new Map<Id, UserLeadOpportunityData>();

        // Query to get the count of converted Leads grouped by User
        List<AggregateResult> leadResults = [
            SELECT OwnerId, COUNT(Id) leadCount
            FROM Lead
            WHERE IsConverted = TRUE
            GROUP BY OwnerId
        ];

        // Populate the map with Lead counts
        for (AggregateResult leadResult : leadResults) {
            Id userId = (Id) leadResult.get('OwnerId');
            Integer leadCount = (Integer) leadResult.get('leadCount');
            userLeadOpportunityMap.put(userId, new UserLeadOpportunityData(leadCount, 0));
        }

        // Query to get the count of won Opportunities grouped by User
        List<AggregateResult> opportunityResults = [
            SELECT OwnerId, COUNT(Id) opportunityCount
            FROM Opportunity
            WHERE IsWon = TRUE
            GROUP BY OwnerId
        ];

        // Update the map with Opportunity counts
        for (AggregateResult opportunityResult : opportunityResults) {
            Id userId = (Id) opportunityResult.get('OwnerId');
            Integer opportunityCount = (Integer) opportunityResult.get('opportunityCount');

            if (userLeadOpportunityMap.containsKey(userId)) {
                userLeadOpportunityMap.get(userId).opportunityCount = opportunityCount;
            } else {
                userLeadOpportunityMap.put(userId, new UserLeadOpportunityData(0, opportunityCount));
            }
        }

        // Compare the counts and output the results
        for (Id userId : userLeadOpportunityMap.keySet()) {
            UserLeadOpportunityData data = userLeadOpportunityMap.get(userId);
            System.debug('User ID: ' + userId + 
                         ' | Converted Leads: ' + data.leadCount + 
                         ' | Won Opportunities: ' + data.opportunityCount);
        }
    }

    // Inner class to hold Lead and Opportunity counts for each User
    private class UserLeadOpportunityData {
        Integer leadCount;
        Integer opportunityCount;

        public UserLeadOpportunityData(Integer leadCount, Integer opportunityCount) {
            this.leadCount = leadCount;
            this.opportunityCount = opportunityCount;
        }
    }
}