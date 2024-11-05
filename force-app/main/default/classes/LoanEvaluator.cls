// Assign-326

public class LoanEvaluator {
public static void cal(Double loanAmount, Integer loanTerm, Integer creditScore) {
        Double baseInterestRate;
        Date currentDate = Date.today();
        
        if (loanAmount > 100000) {
            baseInterestRate = 5.0; 
        } else {
            baseInterestRate = 4.0; 
        }

        if (creditScore > 750) {
            baseInterestRate -= 0.5; 
        } else if (creditScore < 600) {
            baseInterestRate += 1.0; 

        if (loanTerm > 15) {
            baseInterestRate += 0.5; 
        }

        Double monthlyInterestRate = baseInterestRate / 100 / 12;

        Integer totalPayments = loanTerm * 12;

        Double monthlyRepayment = (loanAmount * monthlyInterestRate) / 
                                  (1 - Math.pow(1 + monthlyInterestRate, -totalPayments));

        Double totalRepayment = monthlyRepayment * totalPayments;

        System.debug('Final Interest Rate: ' + baseInterestRate + '%');
        System.debug('Monthly Repayment Amount: $' + monthlyRepayment);
        System.debug('Total Repayment Amount: $' + totalRepayment);
    }
}
}