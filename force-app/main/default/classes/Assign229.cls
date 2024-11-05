public class Assign229 {
    public static void main(Id AccountId){
        List<Contact> allAccountList = [
        	SELECT Name, Email 
			FROM Contact 
			WHERE AccountId = :accountId    
        ];
        for(Contact con : allAccountList){
            System.debug('Contact Name: ' + con.Name);
            System.debug('Contact Email: ' + con.Email);
        }
    }
}