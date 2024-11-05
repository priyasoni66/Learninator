public class Assign203 {
    public static void main(){
        List<AggregateResult> highValueAccounts = [
            SELECT AccountId, SUM(Amount) totalAmount
            FROM Opportunity
            GROUP BY AccountId
            HAVING SUM(Amount) > 500000
        ];

        List<Id> highValueAccountIds = new List<Id>();
        for (AggregateResult ar : highValueAccounts) {
            highValueAccountIds.add((Id) ar.get('AccountId'));
        }

        List<Case> openCases = [
            SELECT Id, CaseNumber, Status, Account.Name 
            FROM Case 
            WHERE AccountId IN :highValueAccountIds 
            AND Status != 'Closed'
        ];
        for (Case c : openCases) {
            System.debug('Case Number: ' + c.CaseNumber + ', Account Name: ' + c.Account.Name + ', Status: ' + c.Status);
        }
    }
}