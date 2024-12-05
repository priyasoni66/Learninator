/**
* @File Name : AccountController.cls
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

public with sharing class AccountController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getHighRevenueAccountRecords(Integer count) {
        try{
            return [SELECT Id, Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC NULLS LAST LIMIT :count];
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
}