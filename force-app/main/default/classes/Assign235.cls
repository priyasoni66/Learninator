public class Assign235 {
    public static void main(){
        List<Opportunity> oppWithStage = [
        	SELECT Id, Name, StageName 
			From Opportunity
			WHERE StageName = 'Proposal/Price Quote'    
        ];
        for(Opportunity opp : oppWithStage){
            System.debug('Opportunity Name: ' + opp.Name);
            System.debug('Stage : ' + opp.StageName);
        }
    }
}