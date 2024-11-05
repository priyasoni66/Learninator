public class Assign207 {
    
    public static void main() {
        Date today = Date.today();
        Date thirtyDaysFromNow = today.addDays(30);
        Date sixtyDaysAgo = today.addDays(-60);
        
        List<Opportunity> upcomingOpportunities = [
            SELECT Id, Name, AccountId, CloseDate
            FROM Opportunity
            WHERE CloseDate >= :today AND CloseDate <= :thirtyDaysFromNow
        ];
        
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : upcomingOpportunities) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }
        
        if (accountIds.isEmpty()) {
            System.debug('No upcoming opportunities found with related accounts.');
            return;
        }
        List<Account> accounts = [
            SELECT Id, Name 
            FROM Account 
            WHERE Id IN :accountIds
        ];

        Set<Id> inactiveAccountIds = new Set<Id>();

        List<Task> recentTasks = [
            SELECT WhatId 
            FROM Task 
            WHERE WhatId IN :accountIds 
            AND LastModifiedDate >= :sixtyDaysAgo
        ];

        List<Event> recentEvents = [
            SELECT WhatId 
            FROM Event 
            WHERE WhatId IN :accountIds 
            AND LastModifiedDate >= :sixtyDaysAgo
        ];

        Set<Id> activeAccountIds = new Set<Id>();
        
        for (Task task : recentTasks) {
            activeAccountIds.add(task.WhatId);
        }
        
        for (Event event : recentEvents) {
            activeAccountIds.add(event.WhatId);
        }

        for (Account acc : accounts) {
            if (!activeAccountIds.contains(acc.Id)) {
                inactiveAccountIds.add(acc.Id);
            }
        }

        if (!inactiveAccountIds.isEmpty()) {
            for (Opportunity opp : upcomingOpportunities) {
                if (inactiveAccountIds.contains(opp.AccountId)) {
                    System.debug('Opportunity ' + opp.Name + ' is related to an inactive account: ' + opp.AccountId);
                }
            }
        } else {
            System.debug('All related accounts have had recent activity.');
        }
    }
}