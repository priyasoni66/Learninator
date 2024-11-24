public class Assign606Handler {
    public static void main(List<Task> tasks, Map<Id, Task> oldTaskMap) {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        Set<Id> accountIds = new Set<Id>();

        for (Task task : tasks) {
            Task oldTask = oldTaskMap.get(task.Id);
            if (task.Status == 'Completed' && oldTask.Status != 'Completed' && task.WhatId != null) {
                if (task.WhatId.getSObjectType() == Account.SObjectType) {
                    accountIds.add(task.WhatId);
                }
            }
        }

        Map<Id, Account> accounts = new Map<Id, Account>([
            SELECT Id, Owner.Email 
            FROM Account 
            WHERE Id IN :accountIds
        ]);

        for (Task task : tasks) {
            Task oldTask = oldTaskMap.get(task.Id);
            if (task.Status == 'Completed' && oldTask.Status != 'Completed' && task.WhatId != null) {
                if (task.WhatId.getSObjectType() == Account.SObjectType) {
                    Account relatedAccount = accounts.get(task.WhatId);
                    
                    if (relatedAccount != null && relatedAccount.Owner.Email != null) {
                        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                        email.setToAddresses(new String[] {relatedAccount.Owner.Email});
                        email.setSubject('Task Completed Notification');
                        email.setPlainTextBody('A task related to your account "' + relatedAccount.Name +
                                               '" has been marked as completed. Task subject: ' + task.Subject);
                        emails.add(email);
                    }
                }
            }
        }
        
        if (emails.size() > 0) {
            Messaging.sendEmail(emails);
        }
    }
}