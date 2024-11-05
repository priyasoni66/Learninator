public class Assign242 {
    public static void main(){
        List<Opportunity> oppWithProb = [
        SELECT Id, Name, OwnerId, Probability, Owner.IsActive, Owner.Email
                                     FROM Opportunity
                                     WHERE Probability > 80
            						 
        ];
        for(Opportunity opp : oppWithProb){
                System.debug('Name: ' + opp.Name);
                System.debug('Email: ' + opp.Owner.Email);
            	System.debug('Probability: ' + opp.Probability);
            }
        }
   }