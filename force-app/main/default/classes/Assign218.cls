public class Assign218 {

    public static void main() {
        List<AggregateResult> topOwners = [
            Select OwnerId, SUM(Amount) totalClosedWonAmount
            From Opportunity
            Where StageName = 'Closed Won'
            GROUP BY OwnerId
            ORDER BY SUM(Amount) DESC
            LIMIT 3
        ];

        Set<Id> ownerIds = new Set<Id>();
        for (AggregateResult ar : topOwners) {
            ownerIds.add((Id)ar.get('OwnerId'));
        }

        List<User> users = [
            SELECT Id, Name, Email
            FROM User
            WHERE Id IN :ownerIds
        ];

        for (AggregateResult ar : topOwners) {
            Id ownerId = (Id)ar.get('OwnerId');
            Decimal totalAmount = (Decimal)ar.get('totalClosedWonAmount');  

            for (User u : users) {
                if (u.Id == ownerId) {
                    System.debug('Owner: ' + u.Name);
                    System.debug('Email: ' + u.Email);
                    System.debug('Total Closed-Won Value: ' + totalAmount);
                }
            }
        }
    }
}