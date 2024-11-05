// Assign-314

public class InsurancePremium {
    Integer age;
    Boolean drivingRecord;
    Double carValue;
    
    public InsurancePremium(Integer age, Boolean drivingRecord, Double carValue){
        this.age = age;
        this.drivingRecord = drivingRecord;
        this.carValue = carValue;      
    }
    
    public void calPremium(){
        Double finalPremium = carValue;
        if(age < 25){
            finalPremium = finalPremium + (finalPremium*20/100);
            System.debug('Applied 20% surcharge for age < 25: ' + finalPremium);
        } 
        if (carValue > 50000){
           finalPremium = finalPremium + (finalPremium*15/100);
           System.debug('Applied 15% surcharge for car value > 50,000: ' + finalPremium);
        }
        if(drivingRecord){
            finalPremium = finalPremium - (finalPremium*10/100);
            System.debug('Applied 10% discount for no accidents: ' + finalPremium);
        }
      	System.debug('Final Premium ' + finalPremium);
    }
}