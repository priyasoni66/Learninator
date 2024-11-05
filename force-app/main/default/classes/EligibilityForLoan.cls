// Assign-310

public class EligibilityForLoan {
	Integer age;
	Double annualIncome;
	Double reqLoanAmount;
    
    public EligibilityForLoan(Integer age, Double annualincome, Double reqLoanAmount){
        this.age = age;
        this.annualIncome = annualIncome;
        this.reqLoanAmount = reqLoanAmount;
    }	
    
    public void checkEligibility(){
        Double amountCal = annualIncome - ((annualIncome*50)/100);
        if(age >= 18) {
            if(annualIncome > 30000){
                if(reqLoanAmount < amountCal){
                    System.debug('Eligible for loan');
                }
                   else{
                       System.debug('Not Eligible for loan');
                }
            }
        } 
    }
}