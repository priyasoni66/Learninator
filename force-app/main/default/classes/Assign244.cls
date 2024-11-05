public class Assign244 {
    public static void main(){
        List<Case> caseWithHighPriority = [
            SELECT CaseNumber, Priority, OwnerId, Owner.Name, Owner.IsActive
            FROM Case
            WHERE Priority = 'High'         
        ];
        for (Case c : caseWithHighPriority) {
            if (c.Owner.IsActive) {
                System.debug('Case Number: ' + c.CaseNumber + 
                             ', Priority: ' + c.Priority + 
                             ', Owner Name: ' + c.Owner.Name);
            }
        }
    }
}