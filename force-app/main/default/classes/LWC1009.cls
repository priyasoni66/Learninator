/**
* @File Name : LWC1009.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : December 5, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | December 5, 2024 |   | Initial Version
**/

public class LWC1009 {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunties(Date startDate, Date endDate) {
        // Handle cases where no dates are provided
        if (startDate == null || endDate == null) {
            return new List<Opportunity>();
        }

        // Return filtered opportunities
        return [
            SELECT Id, Name, CloseDate, Amount
            FROM Opportunity
            WHERE CloseDate >= :startDate AND CloseDate <= :endDate
        ];
    }
}