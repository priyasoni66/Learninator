public class Assign230 {
    public static void main(){
        List<Opportunity> closedWonOpp = [
        	SELECT Id, Name, StageName, CloseDate 
			FROM Opportunity
			WHERE StageName = 'Closed Won'    
        ];
        for(Opportunity opp : closedWonOpp){
            System.debug('Opportunity Name: ' + opp.Name);
            System.debug('Opportunity Stage: ' + opp.StageName);
            System.debug('Opportunity Closed Date ' + opp.CloseDate);
        }
    }
}