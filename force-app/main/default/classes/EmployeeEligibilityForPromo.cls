// Assign-312

public class EmployeeEligibilityForPromo {
	Integer yearOfService;
	Decimal performanceRating;
	Double currentSalary;
    
    public EmployeeEligibilityForPromo(Integer yearOfService, Decimal performanceRating, Double currentSalary){
        this.yearOfService = yearOfService;
		this.performanceRating = performanceRating;
		this.currentSalary = currentSalary;
    }
    
    public void resultCalculation(){
        if(yearOfService > 5){
            if(performanceRating > 4.0){
                if(currentSalary < 100000){
                    System.debug('Employee is qualified for Promotion and Bonus');
                } else {
                    System.debug('Current Salary is above 100000, hence Employee is not qualified for Promotion and Bonus');
                }
            } else {
            	System.debug('Performance Rating is below 4.0, hence Employee is not qualified for Promotion and Bonus');
            }
        }else {
            System.debug('Years of Service is less than 5 years, hence Employee is not qualified for Promotion and Bonus');
        }
    }
}