public class Assign227 {
    public static void main(){
        List<Case> caseList = [
        	SELECT Id, CaseNumber, 
			(SELECT Id FROM Tasks), 
			(SELECT Id FROM Events)
			FROM Case    
        ];
        
        for(Case c : caseList){
        Integer taskCount = c.Tasks.size();
        Integer eventCount = c.Events.size();
            if(taskCount == 0 || eventCount == 0){
                System.debug('Case Id: ' + c.Id);
                System.debug('Case Number: ' + c.CaseNumber);
            }
        }
    }
}