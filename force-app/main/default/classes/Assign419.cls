public class Assign419 {
    public static void main(){
        List<Opportunity> oppList = [
            SELECT Id, StageName, Amount, AccountId
            FROM Opportunity  
        ];
        
        Map<String, List<Opportunity>> oppByStageNameMap = new Map<String, List<Opportunity>>();
        Map<String, Decimal> totalAmountforEachStageMap = new Map<String, Decimal>();
        
        for (Opportunity opp : oppList) {
            String stageName = opp.StageName;
            
            List<Opportunity> tempOppList = oppByStageNameMap.get(stageName);
            if (tempOppList == null) {
                tempOppList = new List<Opportunity>();
            }
            tempOppList.add(opp);
            oppByStageNameMap.put(stageName, tempOppList);
            
            Decimal totalAmount = totalAmountforEachStageMap.get(stageName);
            if (totalAmount == null) {
                totalAmount = 0;
            }
            if (opp.Amount != null) {
                totalAmount = totalAmount + opp.Amount;
            }    
            totalAmountforEachStageMap.put(stageName, totalAmount);
        }
		System.debug('Opportunity by StageName: ' + oppByStageNameMap);
    	System.debug('Total Amount for Each StageName: ' + totalAmountforEachStageMap);
    }
}