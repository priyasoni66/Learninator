/**
* @File Name : LWC1008.cls
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

public class LWC1008 {
	@AuraEnabled
    public static Event createEvent(Date startDate, Date endDate, String subject) {
        try {
            Event newEvent = new Event();
            newEvent.StartDateTime = startDate;
            newEvent.EndDateTime = endDate;
            newEvent.Subject = subject;
            insert newEvent;

            return newEvent;
			
        } catch (Exception e) {
            throw new AuraHandledException('Error while creating event: ' + e.getMessage());
        }
    }
}