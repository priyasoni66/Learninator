public class Assign406 {
    public static void main(){
        List<Account> accList = [
        	SELECT Id, Industry 
            FROM Account	
        ]; 
        Map<String, List<Account>> accByIndustryMap = new Map<String, List<Account>>();
        for (Account acc : accList) {
            String industry = acc.Industry;

            if (accByIndustryMap.get(acc.Industry) == null) {
                accByIndustryMap.put(acc.Industry, new List<Account>());
            }
            accByIndustryMap.get(acc.Industry).add(acc);
        }
        System.debug('Accounts grouped by Industry: ' + accByIndustryMap);
    }
}