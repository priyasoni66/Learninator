public class Assign239 {
    public static void main(){
        List<Account> accountList = [
        	SELECT Id, Name, Type, (SELECT Id, Name, Email FROM Contacts), 
			(SELECT Id, Name FROM Opportunities)
            FROM Account
			WHERE Type Like '%Customer%'
        ];
        for (Account acc : accountList) {
            if (acc.Opportunities.size() > 2) {
                for (Contact con : acc.Contacts) {
                    System.debug('Account Name: ' + acc.Name);
                    System.debug('Contact Name: ' + con.Name);
                    System.debug('Contact Email: ' + con.Email);
                }
            }
        /* for(Account acc : accountList){
            for(Contact con : acc.Contacts){
                for(Opportunity opp : acc.Opportunities){
                    if(acc.Opportunities.size() > 2){
						System.debug('Account Name: ' + acc.Name);
                    	System.debug('Contact Name: ' + con.Name);
                    	System.debug('Contact Email: ' + con.Email);	    
                    }
                }
            } */
    	}
	}
}