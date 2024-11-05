trigger Assign508 on Lead (before insert) {

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
    
    
    for(Lead l : trigger.new) {
        if(existingMails.contains(l.Email)) {
            l.addError('A contact with this email already exists');
        }
    }
}