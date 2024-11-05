public class Assign217 {

    public static void main() {
        List<Case> cases = [
            SELECT Id, CaseNumber, CreatedDate, ClosedDate 
            FROM Case 
            WHERE ClosedDate != NULL
        ];

        for (Case c : cases) {
            Decimal hoursDifference = (c.ClosedDate.getTime() - c.CreatedDate.getTime()) / (1000 * 60 * 60);

            if (hoursDifference < 24) {
                System.debug('Case closed in less than 24 hours: Case Number: ' + c.CaseNumber);
            }
        }
    }
}