trigger Assign506 on Opportunity (before insert) {
	
    for(Opportunity opp : trigger.new){
        if(opp.StageName != null){
        	if(opp.CloseDate == null){
            	opp.CloseDate = System.today().addDays(30);
            }
        } else {
            opp.addError('Opportunity State is Required');
        }
	}
}