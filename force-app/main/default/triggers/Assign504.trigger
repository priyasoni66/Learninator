trigger Assign504 on Lead (before insert) {

    for(Lead l : trigger.new){
        if(l.LeadSource == null){
            l.LeadSource = 'Online';
        }
    }
}