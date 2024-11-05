public class Assign224 {
    public static void main(){
        List<Lead> leadList = [
        	SELECT Id, Name, Email, (SELECT Id FROM Tasks)
			FROM Lead 
        ];
        for(Lead l : leadList){
            Integer taskCount = l.Tasks.size();
            if(taskCount == 0){
                System.debug('Lead Id: ' + l.Id);
				System.debug('Lead Name: ' + l.Name);
				System.debug('Lead Email: ' + l.Email);                
            }
        }
    }
}