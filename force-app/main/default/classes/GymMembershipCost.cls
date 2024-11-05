// Assign-318

public class GymMembershipCost {
	Integer numOfYears;
	Boolean familyMembership;
	Double baseRenCost;
    
    public GymMembershipCost(Integer numOfYears, Boolean familyMembership, Double baseRenCost){
        this.numOfYears = numOfYears;
        this.familyMembership = familyMembership;
        this.baseRenCost = baseRenCost;
    }
    
    public void renCostCal(){
        if(numOfYears > 5){
            baseRenCost = baseRenCost - (baseRenCost*20/100);
            System.debug('Renewal Cost ' + baseRenCost);
        }
        if(familyMembership){
            baseRenCost = baseRenCost - (baseRenCost*10/100);
            
        }
        if(baseRenCost < 2000){
            System.debug('Renewal Cost ' + baseRenCost);
            System.debug('Additionally Free Fitess Class Availed');
        }
    }
}