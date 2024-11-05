public class Assign246 {
    public static void main(){
        List<Opportunity> openOpportunities = [
            SELECT Name, StageName, Account.Id, Account.Name, Account.Industry 
			FROM Opportunity 
			WHERE StageName NOT IN ('Closed Won', 'Closed Lost')
        ];
        for(Opportunity opp : openOpportunities) {
            if(opp.Account != null && opp.Account.Industry == 'Manufacturing') {
                System.debug('Opportunity Name: ' + opp.Name);
                System.debug('Account Industry: ' + opp.Account.Industry);
            }
        }
    }
}