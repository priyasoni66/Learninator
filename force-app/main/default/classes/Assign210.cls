public class Assign210 {
    public static void main() {
        List<AggregateResult> results = [
            SELECT AccountId, SUM(Amount) totalAmount
            FROM Opportunity
            WHERE StageName != 'Closed Won' AND StageName != 'Closed Lost'
            GROUP BY AccountId
        ];
        for (AggregateResult ar : results) {
            Id accountId = (Id) ar.get('AccountId');
            Decimal totalAmount = (Decimal) ar.get('totalAmount');

            System.debug('Account ID: ' + accountId + ', Total Open Opportunity Amount: ' + totalAmount);
        }

        if (results.isEmpty()) {
            System.debug('No open Opportunities found for any Accounts.');
        }
    }
}