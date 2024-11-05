// Assign-315

public class TotalCostOfTrip {
	Double airFare;
    Double hotelStay;
    Double foodAllowance;
     
    public TotalCostOfTrip(Double airFare, Double hotelStay, Double foodAllowance){
        this.airFare = airFare;
        this.hotelStay = hotelStay;
        this.foodAllowance = foodAllowance;
    }
    
    public void costCal(){
        Double totalCost = airFare + hotelStay + foodAllowance;
        System.debug(totalCost);
        if(totalCost > 2000){
            System.debug('qualifies for a first class flight');
        }else if(totalCost > 1000 && totalCost < 2000){
            System.debug('qualifies for a business class flight');
        }else if(totalCost < 1000){
            System.debug('qualifies for a economy class flight');
        }
    }
}