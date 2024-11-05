// Assign-320

public class TaxOwned {
    public static void cal(Double salary, Integer numOfDep, Double taxDed){
        Double tax = 0;
        Double taxableIncome = salary - (numOfDep * 1500) - taxDed;
        if (taxableIncome >= 100000){
            tax = taxableIncome * 30/100;
            System.debug('Taxable Income: ' + taxableIncome);
            System.debug('Total tax: ' + tax);
        }
        if(taxableIncome < 100000 && taxableIncome > 50000){
            tax = taxableIncome * 20/100;
            System.debug('Taxable Income: ' + taxableIncome);
            System.debug('Total tax: ' + tax);
        }
        if(salary < 50000){
            tax = taxableIncome * 10/100;
            System.debug('Taxable Income: ' + taxableIncome);
            System.debug('Total tax: ' + tax);
        }
        salary = salary - tax;
        System.debug('Salary after all deductions: ' + salary);
    }
}