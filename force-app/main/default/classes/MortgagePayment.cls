// Assign-322

public class MortgagePayment {
    public static void cal(Double loanAmount, Double intRate, Integer loanTermYr, Double downPay){
        if(loanTermYr > 20){
            intRate = intRate + (intRate*0.5/100);
        }
        if(downPay > (loanAmount*20/100)){
            intRate = intRate - (intRate*0.25/100);
        }
        Double monthlyIntRate = intRate / 12;
        Integer totalPayments = loanTermYr * 12;
        Double monthlyPayment = (loanAmount * monthlyIntRate) / (1 - Math.pow(1 + monthlyIntRate, -totalPayments));
   		Double remainingBalance = loanAmount;
        System.debug('Amortization Schedule for the first 12 months:');
        System.debug('Month\tPrincipal\tInterest\tRemaining Balance');
        for (Integer month = 1; month <= 12; month++) {
            Double intPayment = remainingBalance * monthlyIntRate;
            Double principalPayment = monthlyPayment - intPayment;

            remainingBalance -= principalPayment;
            System.debug(month + '\t' + String.valueOf(Math.round(principalPayment * 100.0) / 100.0) + '\t' + 
                         String.valueOf(Math.round(intPayment * 100.0) / 100.0) + '\t' + 
                         String.valueOf(Math.round(remainingBalance * 100.0) / 100.0));
    	}
	}
}