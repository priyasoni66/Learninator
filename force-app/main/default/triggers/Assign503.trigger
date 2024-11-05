trigger Assign503 on Contact (before insert) {

    Set<String> contactEmails = new Set<String>();
    for(Contact con : trigger.new){
        if(con.Email != null){
        	contactEmails.add(con.Email);
        }
    }
    
    List<Contact> existingContacts = [
        SELECT Id, Email
		FROM Contact
        WHERE Email IN :contactEmails
    ];
    
    Set<String> existingMails = new Set<String>();
    for(Contact c : existingContacts){
        existingMails.add(c.Email);
    }
    
    for(Contact con : trigger.new) {
        if(existingMails.contains(con.Email)) {
            con.addError('A Contact with this email already exists');
        }
    }
}