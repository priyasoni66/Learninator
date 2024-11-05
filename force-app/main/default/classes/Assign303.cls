public class Assign303 {
    public static void main(){
        List<Contact> conList = [
        	SELECT Id, Name, Email
			FROM Contact
			WHERE Email LIKE '%@oldemail.com'    
        ];
        
        List<Contact> updateCon = new List<Contact>();
        for(Contact c : conList){
        	c.Email = c.Email.replace('@oldemail.com', '@newemail.com');
            updateCon.add(c);
        }
        if(updateCon.size() > 0){
            update updateCon;
        }
    }
}