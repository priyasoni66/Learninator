public class Assign241 {
    public static void main(){
    	List<Account> accWithPartnerType = [
        	SELECT Id, Name, Type, (SELECT Id, Name, Email FROM Contacts)
            FROM Account
            WHERE Type like '%Partner'
        ];
        for(Account acc: accWithPartnerType){
            for(Contact con : acc.Contacts){
                 if(String.isBlank(con.Email)){
                    System.debug('Account Name: ' + acc.Name);
                    System.debug('Contact Name: ' + con.Name);
                }
            }
        }
    }
}