trigger Assign501 on Account (before insert) {
	
    for(Account acc : trigger.new){
        if(acc.Name.Length() < 3){
            acc.addError('Fewer than 3 characters');
        }
    }	
    
}