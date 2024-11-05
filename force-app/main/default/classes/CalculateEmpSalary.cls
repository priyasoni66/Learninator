// Assign-307

public class CalculateEmpSalary {
	Double hourlyWage;
	Integer hoursWorked;
	Double taxPercentage;
    
    public CalculateEmpSalary(Double hourlyWage, Integer hoursWorked, Double taxPercentage){
        this.hourlyWage = hourlyWage;
		this.hoursWorked = hoursWorked;
		this.taxPercentage = taxPercentage;
    } 
    public void empNetSalary(){
		Double totalSalary = hourlyWage * hoursWorked;
        Double taxAmount = totalSalary * (taxPercentage / 100);
		Double netSalary = totalSalary - taxAmount;
        System.debug(netSalary);
    }
}