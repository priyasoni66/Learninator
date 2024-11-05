public class Assign238 {
    public static void main(){
        List<Account> accWithTechIndustry = [
        	SELECT Id, Name, Industry,  
			(SELECT Id, Name, Amount FROM Opportunities WHERE Amount > 1000000) 
            FROM Account
            WHERE Industry = 'Technology'
        ];
        for(Account acc : accWithTechIndustry){
            for(Opportunity opp : acc.Opportunities){
            	System.debug('Account Name: ' + acc.Name);
                System.debug('Opportunity Name: ' + opp.Name);
                System.debug('Amount: ' + opp.Amount);
            }
        }
    }
}