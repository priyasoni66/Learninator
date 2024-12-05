/**
* @File Name : LWC1004.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : December 3, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | December 3, 2024 |   | Initial Version
**/

public with sharing class LWC1004 {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities() {
        return [SELECT Id, Name, StageName, Amount FROM Opportunity LIMIT 50];
    }

    @AuraEnabled
    public static void updateOpportunities(List<Opportunity> updatedOpportunities) {
        try {
            update updatedOpportunities;
        } catch (DmlException e) {
            throw new AuraHandledException('Error updating records: ' + e.getMessage());
        }
    }
}