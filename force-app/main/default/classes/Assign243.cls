public class Assign243 {
    public static void execute() {
        List<Opportunity> closedWonOpps = [
            SELECT Id, Name, (SELECT Id, Subject, Status FROM Tasks)
            FROM Opportunity
            WHERE StageName = 'Closed Won'
        ];
        
        for (Opportunity opp : closedWonOpps) {
            for (Task task : opp.Tasks) {
                if (task.Status == 'In Progress') {
                    System.debug('Opportunity Name: ' + opp.Name);
                    System.debug('Task Subject: ' + task.Subject);
                }
            }
        }
    }
}