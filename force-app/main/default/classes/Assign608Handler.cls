public class Assign608Handler {
    public static void main(List<Opportunity> opportunities, Map<Id, Opportunity> oldOpportunityMap) {
        List<Task> tasksToInsert = new List<Task>();

        for (Opportunity opp : opportunities) {
            if (opp.StageName == 'Closed Won' && opp.AccountId != null) {
                Opportunity oldOpp = oldOpportunityMap.get(opp.Id);
                
                if (oldOpp.StageName != 'Closed Won') {
                    List<Contact> relatedContacts = [
                        SELECT Id
                        FROM Contact
                        WHERE AccountId = :opp.AccountId
                    ];

                    for (Contact contact : relatedContacts) {
                        Task followUpTask = new Task(
                            WhatId = opp.Id,
                            WhoId = contact.Id,
                            Subject = 'Follow Up on Closed Won Opportunity',
                            Description = 'The Opportunity "' + opp.Name + '" has been closed successfully.',
                            ActivityDate = System.today().addDays(7), 
                            Status = 'Not Started' 
                        );
                        tasksToInsert.add(followUpTask);
                    }
                }
            }
        }

        if (tasksToInsert.size() > 0) {
            insert tasksToInsert;
        }
    }
}