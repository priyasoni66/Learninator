// Assign-329

public class TaxCollection {
    public static void cal(Double annualIncome, Integer numDependents, Double deductions, Date filingDate) {
        Double dependentDeduction = 2000;
        Double lateFilingPenaltyRate = 5/100;
        Date taxDeadline = Date.newInstance(Date.today().year(), 4, 15);

        Double taxableIncome = annualIncome - (numDependents * dependentDeduction) - deductions;

        Double taxRate;
        if (taxableIncome > 100000) {
            taxRate = 0.30;
        } else if (taxableIncome > 50000) {
            taxRate = 0.20;
        } else {
            taxRate = 0.10;
        }

        Double taxAmount = taxableIncome * taxRate;

        Double penalty = 0.0;
        if (filingDate > taxDeadline) {
            penalty = taxAmount * lateFilingPenaltyRate;
        }

        System.debug('Taxable Income: ' + taxableIncome);
        System.debug('Tax Amount: ' + taxAmount);
        System.debug('Deductions: ' + deductions);
        System.debug('Late Filing Penalty: ' + penalty);
    }
}