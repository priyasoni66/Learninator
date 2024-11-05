trigger Assign502 on Opportunity (before insert) {
	
    for(Opportunity opp : trigger.new){
        if(opp.StageName == null){
            opp.StageName = 'Prospecting';
        }
    }
}