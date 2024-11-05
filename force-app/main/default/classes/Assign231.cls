public class Assign231 {
    public static void main(){
        List<User> activeUsers = [
        	SELECT Id, Name, Email, IsActive
			FROM User    
        ];
        For(User u : activeUsers){
            System.debug('User Name : ' + u.Name);
            System.debug('User Email : ' + u.Email);
        }
    }
}