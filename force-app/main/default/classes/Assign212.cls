public class Assign212 {
    public static void main(){
        Date today = Date.Today();
        List<Account> accList = [
            SELECT Id, Name, 
            (SELECT Id, ActivityDate 
			FROM Tasks WHERE ActivityDate < :today)
            FROM Account
        ];
        for(Account acc : accList){
            System.debug('Account Name : ' + acc.Name);
        }
    }
}