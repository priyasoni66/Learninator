// Assign-317

public class CostOfHotelStay {
	Integer numOfNights;
    Double nightlyRate;
    Boolean isLPM;
    
    public CostOfHotelStay(Integer numOfNights, Double nightlyRate, Boolean isLPM){
        this.numOfNights = numOfNights;
    	this.nightlyRate = nightlyRate;
    	this.isLPM = isLPM;
    }
    
    public void costCal(){
        Double totalCost = numOfNights * nightlyRate;
        if(numOfNights >= 7){
            totalCost = totalCost - (totalCost*15/100);
        }
        if(isLPM){
            totalCost = totalCost - (totalCost*20/100);
        }
        if(totalCost > 1000){
            Integer voucher = 150;
            totalCost = totalCost - voucher;
            System.debug(voucher);
        }
        System.debug(totalCost);
    }
}