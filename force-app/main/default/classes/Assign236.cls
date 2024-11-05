public class Assign236 {
    public static void main(){
               	List<Contact> contactsWithNoEmail = [
                    SELECT Id, Email, Name  
                    FROM Contact 
                    WHERE Email = ''
                ];
        for(Contact con : contactsWithNoEmail){
            System.debug('Contact Name: ' + con.Name);
            System.debug('Contact Id: ' + con.Id);
        }
    }
}