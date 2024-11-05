public class Assign424 {
    public static void main(){
        List<Opportunity> oppList = [
        	SELECT Id, AccountId, Amount, StageName 
			FROM Opportunity   
        ];
        List<Account> accList = [
        	SELECT Id
            FROM Account
        ];
        Map<String, List<Opportunity>> oppByStageNameMap = new Map<String, List<Opportunity>>();
        Map<Id, Decimal> oppByTotalAmount = new Map<Id, Decimal>();
        for(Opportunity opp : oppList){
            String stageName = opp.StageName;
            Id accountId = opp.AccountId;
            List<Opportunity> tempOppList = oppByStageNameMap.get(stageName);
            if(tempOppList == Null){
                tempOppList = new List<Opportunity>();
            }
            tempOppList.add(opp);
            oppByStageNameMap.put(stageName, tempOppList);
            
            Decimal totalAmount = oppByTotalAmount.get(accountId);
			if (totalAmount == null) {
    			totalAmount = 0;
            }
            if (opp.Amount != null) {
    			totalAmount = totalAmount + opp.Amount;
			}    
            	oppByTotalAmount.put(accountId, totalAmount);
			}
        System.debug('Opportunity by StageName: ' + oppByStageNameMap);
        System.debug('Opportunity by Total Amount: ' + oppByTotalAmount);
        }
    }