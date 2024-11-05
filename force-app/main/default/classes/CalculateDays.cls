// Assign-304

public class CalculateDays { 
    public static void dateCalculation(){ 
		Date todayDate = Date.today();
        Date newDate = todayDate + 30;
        System.debug('Date after 30 days ' + newDate);
    }
}