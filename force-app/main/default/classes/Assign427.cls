public class Assign427 {
    public static void main(){
        List<Opportunity> oppList = [
            SELECT Id, Name, CloseDate, StageName
            FROM Opportunity
        ];
        Map<Date, List<Opportunity>> oppByCloseDate = new Map<Date, List<Opportunity>>();
		Map<String, List<Opportunity>> oppByStageName = new Map<String, List<Opportunity>>();
		List<Opportunity> lostOppList = new List<Opportunity>();
        for(Opportunity opp : oppList){
            Date closeDate = opp.CloseDate;
            String stageName = opp.StageName;
            List<Opportunity> tempOppList = oppByCloseDate.get(closeDate);
            List<Opportunity> tempOppList2 = oppByStageName.get(stageName);

            if(tempOppList == null){
                tempOppList = new List<Opportunity>();
            }
            if(tempOppList2 == null){
                tempOppList2 = new List<Opportunity>();
            }
            if(stageName == 'Closed Lost'){
                lostOppList.add(opp);
            }
            tempOppList.add(opp);
            tempOppList2.add(opp);
        	oppByCloseDate.put(closeDate, tempOppList);
            oppByStageName.put(stageName, tempOppList2);
                     
        }
    	System.debug('Opp by Close Date : ' + oppByCloseDate);
    	System.debug('Opp by Stage Name : ' + oppByStageName);
    	System.debug('Lost Opportunities : ' + lostOppList);
	}
}