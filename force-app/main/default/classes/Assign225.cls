public class Assign225 {

    public static void main() {
        List<AggregateResult> assetCounts = [
            SELECT AccountId, COUNT(Id) totalCount 
            FROM Asset 
            GROUP BY AccountId
        ];

        for (AggregateResult result : assetCounts) {
            Id accountId = (Id) result.get('AccountId');
            Long assetCount = (Long) result.get('totalCount');
            
            System.debug('Account ID: ' + accountId);
			System.debug('Number of Assets: ' + assetCount);
        }
    }
}