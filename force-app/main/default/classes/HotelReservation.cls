// Assign-324

public class HotelReservation {
    public static void cal(Date checkInDate, Integer numOfNights, Double roomRatePerNight){
        Set<Date> peakSeasonDates = new Set<Date>{
            Date.newInstance(2024, 12, 24),
            Date.newInstance(2024, 12, 25),    
        	Date.newInstance(2025, 1, 1),
            Date.newInstance(2025, 7, 4)    
    };
        Double totalCost = numOfNights * roomRatePerNight;
        Double surcharge = 0;
        Double discount = 0;
        for(Integer i = 0; i < numOfNights; i++){
            Date currentNight = checkInDate.addDays(i);
            if(peakSeasonDates.contains(currentNight)){
                surcharge = surcharge + (totalCost * 20/100);
                break;
            }
        }
        if (checkInDate > Date.today().addDays(10)){
            discount = discount + (totalCost*15/100);
        }
        if(numOfNights > 7){
            discount = discount + (totalCost*10/100);
        }
		totalCost = totalCost + (surcharge - discount);	

        System.debug('Total Cost: ' + totalCost);
        System.debug('Surcharge Applied: ' + surcharge);
        System.debug('Discount Applied: ' + discount);
    }
}