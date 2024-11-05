public class Assign408 {
    public static void main(){
    	List<Lead> leadList = [
        	SELECT Id, LeadSource
			FROM Lead    
        ]; 
        Map<String, List<Lead>> leadByLeadSourceMap = new Map<String, List<Lead>>();
        for(Lead obj : leadList){
            String leadSource = obj.LeadSource;
            if(leadByLeadSourceMap.get(obj.LeadSource) == null){
                leadByLeadSourceMap.put(obj.LeadSource, new List<Lead>());   
            }
			leadByLeadSourceMap.get(obj.LeadSource).add(obj);
        }
        System.debug('Lead group by LeadSource: ' + leadByLeadSourceMap);
    }
}