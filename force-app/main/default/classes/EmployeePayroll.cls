// Assign-325

public class EmployeePayroll {
    public static void cal(Double baseSalary, Integer totalHoursWorked, Integer overtimeHours, Integer leaveBalance, Date employmentStartDate) {
        Double grossSalary = baseSalary;
        Double overtimePay = 0.0;
        Double leaveDeduction = 0.0;
        Double finalAmount = 0.0;
        Boolean isEligibleForBonus = false;

        if (totalHoursWorked > 160) {
            Double hourlyRate = baseSalary / 160;
            overtimePay = overtimeHours * hourlyRate * 1.5;
        }

        if (leaveBalance < 10) {
            leaveDeduction = 100.0;
        }

        if (employmentStartDate.addYears(3) <= Date.today()) {
            isEligibleForBonus = true;
        }

        finalAmount = grossSalary + overtimePay - leaveDeduction;

        if (isEligibleForBonus) {
            finalAmount += grossSalary * 0.10;
        }

        System.debug('Gross Salary: ' + grossSalary);
        System.debug('Overtime Pay: ' + overtimePay);
        System.debug('Leave Deduction: ' + leaveDeduction);
        System.debug('Final Salary: ' + finalAmount);
    }
}