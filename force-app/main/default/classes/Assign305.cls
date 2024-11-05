public class Assign305 {
    public static void main(){
        Date oneYearAgo = Date.today().addYears(-1);
        String leadRating = 'Cold';
        List<Lead> leadList = [
        	SELECT Id, Rating, LastModifiedDate 
			FROM Lead
			WHERE Rating = :leadRating  
            AND LastModifiedDate < :oneYearAgo
        ];
        
        if (leadList.size() > 0) {
            delete leadList;
        }
    }
}