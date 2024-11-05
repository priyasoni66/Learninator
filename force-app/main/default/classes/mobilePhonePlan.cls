// Assign-319

public class mobilePhonePlan {
	Integer numOfMinUsed;
    Integer numOfTextSent;
    Double dataUsage;
	
    public mobilePhonePlan(Integer numOfMinUsed, Integer numOfTextSent, Double dataUsage){
        this.numOfMinUsed = numOfMinUsed;
        this.numOfTextSent = numOfTextSent;
        this.dataUsage = dataUsage;
    }
    
    public void planCal(){
        String plan = '';
        if(numOfMinUsed > 1000 && dataUsage > 10){
            plan = 'Premium Plan';
            System.debug('Customer Plan: ' + plan);
        }
        if((numOfMinUsed > 500 && numOfMinUsed < 1000) && (dataUsage > 5 && dataUsage < 10)){
            plan = 'Standard Plan';
            System.debug('Customer Plan: ' + plan);
        }
        if(numOfMinUsed < 500 && dataUsage < 5){
            plan = 'Basic Plan';
            System.debug('Customer Plan: ' + plan);
        }  
    }
}