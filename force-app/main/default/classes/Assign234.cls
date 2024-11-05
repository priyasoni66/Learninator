public class Assign234 {
    public static void main(){
               	List<Case> caseWithHighPriority = [
                    SELECT Id, CaseNumber, Subject, Status 
                    FROM Case 
                    WHERE Priority = 'High'
                ];

        for(Case cases : caseWithHighPriority){
            System.debug(cases);
        }
    }
}