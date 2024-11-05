public class Assign304 {
    public static void main() {
        Date dateDiff = Date.today().addDays(-30);
        String caseStatus = 'Working';
        List<Case> openCases = [
            SELECT Id, Status, LastModifiedDate
            FROM Case
            WHERE Status = :caseStatus
            AND LastModifiedDate < :dateDiff
        ];
        
        for (Case c : openCases) {
            c.Status = 'Closed';
        }
       
        if (openCases.size() > 0) {
            update openCases;
        }
    }
}