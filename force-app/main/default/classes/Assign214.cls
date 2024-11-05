public class Assign214 {
    public static void main() {
        List<Case> caseList = [
            SELECT Id, CaseNumber, Subject, AccountId
            FROM Case
            WHERE Priority = 'High' AND Status != 'Closed'
        ];

        if (caseList.isEmpty()) {
        } else {
            for (Case c : caseList) {
                System.debug('Case ID: ' + c.Id + 
                             ', Case Number: ' + c.CaseNumber + 
                             ', Subject: ' + c.Subject + 
                             ', Account ID: ' + c.AccountId);
            }
        }
    }
}