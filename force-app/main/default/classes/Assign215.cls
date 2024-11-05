public class Assign215 {
    public static void main(){
        List<AggregateResult> results = [
            SELECT OwnerId, AVG(Amount) averageAmount
            FROM Opportunity
            GROUP BY OwnerId
        ];
        for (AggregateResult ar : results) {
            Id ownerId = (Id)ar.get('OwnerId');
            Decimal averageAmount = (Decimal)ar.get('averageAmount');
            System.debug('Owner Id: ' + ownerId + ', Average Amount: ' + averageAmount);
        }
    }
}