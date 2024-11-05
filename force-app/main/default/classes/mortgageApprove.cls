// Assign-316

public class mortgageApprove {
	Integer creditScore;
    Double annualIncome;
    Double homeValue;
    Double loanAmount;
    Double downPayment;
    
    public mortgageApprove(Integer creditScore, Double annualIncome, Double homeValue, Double loanAmount, Double downPayment){
        this.creditScore = creditScore;
    	this.annualIncome = annualIncome;
        this.homeValue = homeValue;
    	this.loanAmount = loanAmount;
        this.downPayment = downPayment;
    }
    
    public void morCal(){
        Double interestRate = 5; 
        if(creditScore > 700 && annualIncome > 50000){
            System.debug('Approve Mortgage');
        }
        if (loanAmount < (homeValue*80/100)){
            interestRate = 3.5;
            System.debug('Preferred Interest Rate Approved: ' + interestRate + '%');
        }
        else {
            System.debug('Interest Rate: ' + interestRate + '%');
        }
        if (creditScore < 600 || annualIncome < 30000){
            System.debug('Mortgage not Approved');
        }
    }
}