public class Assign240 {
    public static void main(){
        Date thirtyDaysAgo = Date.today().addDays(-30);
        List<Case> recentCases = [
    SELECT Id, Subject, IsClosed, Owner.Email, CreatedDate, Owner.Id, Owner.Name
    FROM Case
    WHERE CreatedDate >= :thirtyDaysAgo
			
        ];
        for(Case c : recentCases){
            System.debug('User Name: ' + c.Owner.Name);
            System.debug('User Email: ' + c.Owner.Email);
        }   
    }
}