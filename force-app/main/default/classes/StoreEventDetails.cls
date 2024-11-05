// Assign-305

public class StoreEventDetails {
    public static void displayEventDetails(String eventName, Date eventDate, Time startTime) {
        Datetime eventDateTime = Datetime.newInstance(eventDate, startTime);
        Datetime currentDateTime = Datetime.now();
        
        Long secondsRemaining = eventDateTime.getTime() - currentDateTime.getTime();
        
        if (secondsRemaining <= 0) {
            System.debug('The event has already passed.');
            return;
        }
        Long hours = secondsRemaining / 3600;
        Long remainingSeconds = secondsRemaining - (hours * 3600);
        Long minutes = remainingSeconds / 60;
        Long seconds = remainingSeconds - (minutes * 60);
               
        System.debug('Event Name: ' + eventName);
        System.debug('Event Date: ' + eventDate);
        System.debug('Start Time: ' + startTime);
        System.debug('Time Remaining: ' + hours + ' hours, ' + minutes + ' minutes, and ' + seconds + ' seconds remaining until the event.');
    }
}