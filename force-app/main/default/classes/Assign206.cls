public class Assign206 {
    public static void main(){
        Date today = Date.Today();
        List<Account> accList = [
        	SELECT Id, Name, High_Risk__c, 
                (SELECT Id, ActivityDate FROM Tasks WHERE ActivityDate < :today),
                (SELECT Id FROM Opportunities WHERE CloseDate > :today)
            FROM Account
            WHERE High_Risk__c = true
        ];
        for(Account acc : accList){
            System.debug('Account Name : ' + acc.Name);
        }
    }
}