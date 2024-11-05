public class Assign228 {
    public static void main() {
        Date today = Date.today();
        Date past30Days = today.addDays(-30);

        List<Lead> leadsCreated = [
            SELECT Id, Name, Email, CreatedDate 
            FROM Lead 
            WHERE CreatedDate >= :past30Days
        ];

        for (Lead l : leadsCreated) {
            if (l.Email != null && l.Email != '') {
                System.debug('Lead Name: ' + l.Name + ' - OK');
            } else {
                System.debug('Lead Name: ' + l.Name + ' - NOT OK');
            }
        }
    }
}