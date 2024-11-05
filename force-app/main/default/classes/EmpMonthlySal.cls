// Assign-323

public class EmpMonthlySal {
    public static void cal(Double hourlyWage, Integer hoursWorked, Integer taxBracket) {
        Double grossSalary;
        Double taxAmount;
        Double netSalary;
        Double taxRate;
        if (hoursWorked > 160) {
            Integer overtimeHours = hoursWorked - 160;
            grossSalary = (160 * hourlyWage) + (overtimeHours * hourlyWage * 1.5);
        } else {
            grossSalary = hoursWorked * hourlyWage;
        }
        if (taxBracket == 1) {
            taxRate = 0.30;
        } else if (taxBracket == 2) {
            taxRate = 0.20;
        } else if (taxBracket == 3) {
            taxRate = 0.10;
        } else {
            System.debug('Invalid tax bracket.');
            return;
        }
        taxAmount = grossSalary * taxRate;
        if (grossSalary > 5000) {
            taxAmount = taxAmount + grossSalary * 0.02;
        }

        netSalary = grossSalary - taxAmount;

        System.debug('Gross Salary: ' + grossSalary);
        System.debug('Tax Amount: ' + taxAmount);
        System.debug('Net Salary: ' + netSalary);
    }
}