// Assign-330

public class FlightReservations {
    public static void cal(Double ticketPrice, Date depDate, String cusStatus, Date canDate){
        Double discount = 0;
        Double canFee = 0;
        if(cusStatus.equals('Frequent Flyer')){
           ticketPrice = ticketPrice - (ticketPrice*20/100);
        }
        if(ticketPrice > 1000){
            System.debug('First Class Upgraded');
        }
        if(canDate.addDays(7) < depDate){
            canFee = ticketPrice * 0.10;
        } else {
            canFee = ticketPrice * 0.30;
        }
        System.debug('Final Price: ' + ticketPrice);
        System.debug('Cancellation Fee: ' + canFee);
    }
}