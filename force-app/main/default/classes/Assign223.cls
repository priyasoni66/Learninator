public class Assign223 {
    public static void main(){
        Date today = Date.today();
    	List<Case> pendingCases = [
            SELECT Id, CreatedDate, Status
            FROM Case
            WHERE Status != 'Closed'
            ORDER BY CreatedDate ASC
            LIMIT 5
        ];

        for (Case c : pendingCases) {
            Date caseCreatedDate = c.CreatedDate.date();
            Integer daysPending = today.daysBetween(caseCreatedDate);
            System.debug('Case ID: ' + c.Id);
			System.debug('Created Date: ' + caseCreatedDate);
            System.debug('Days Pending: ' + daysPending); 
            System.debug('Status: ' + c.Status);
        }
    }
}