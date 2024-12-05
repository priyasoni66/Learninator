/**
* @File Name : LWC1010.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : December 4, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | December 4, 2024 |   | Initial Version
**/

public class LWC1010 {
    @AuraEnabled(cacheable=true)
    public static List<Event> getEvents() {
        Date today = Date.today();
        Date nextWeek = today.addDays(7);
        
        List<Event> events = [SELECT Id, Subject, StartDateTime, Owner.Name 
                              FROM Event 
                              WHERE StartDateTime >= :today 
                              AND StartDateTime <= :nextWeek
                              ORDER BY StartDateTime];

        return events;
    }
}