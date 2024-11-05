public class Assign226 {
    public static void main(){
        List<AggregateResult> contactRoleCounts = [
            SELECT Role, COUNT(Id) totalCount 
            FROM OpportunityContactRole 
            GROUP BY Role
        ];

        for (AggregateResult result : contactRoleCounts) {
            String role = (String) result.get('Role');
            Long count = (Long) result.get('totalCount');
            
            System.debug('Role: ' + role);
			System.debug('Number of Contacts: ' + count);
        }
    }
}