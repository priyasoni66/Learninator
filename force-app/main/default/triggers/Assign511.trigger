trigger Assign511 on Lead (after insert) {

    Set<String> leadEmails = new Set<String>();
    for(Lead l : trigger.new){
        if(l.Email != null){
        	leadEmails.add(l.Email);
        }
    }
    
    List<Contact> existingContacts = [
        SELECT Id, Email
		FROM Contact
        WHERE Email IN :leadEmails
    ];
    
    Set<String> existingMails = new Set<String>();
    for(Contact c : existingContacts){
        existingMails.add(c.Email);
    }
    
    List<Task> tasksToInsert = new List<Task>();
    
    for(Lead l : trigger.new) {
        if(existingMails.contains(l.Email)) {
            Task newTask = new Task(Subject = 'Possible Duplicate');
            tasksToInsert.add(newTask);
        }
    }

    if (tasksToInsert.size() > 0) {
        insert tasksToInsert;
    }
}