public class Assign216 {
    public static void main(){
       Date ninetyDaysAgo = Date.today().addDays(-90);
    	List<Account> accList = [
        	SELECT Id, Name, (SELECT Id, ActivityDate FROM Tasks WHERE ActivityDate >: ninetyDaysAgo), 
			(SELECT Id, ActivityDate FROM Events WHERE ActivityDate >: ninetyDaysAgo)
			FROM Account    
        ];    
        for(Account acc : accList){
            Integer taskCount = acc.Tasks.size();
            Integer EventCount = acc.Events.size();
            if(taskCount == 0 && EventCount == 0){
                System.debug('Account Name: ' + acc.Name);
            }
        }
    }
}