/**
* @File Name : LWC1003.cls
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

public class LWC1003 {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String searchKey) {
        try {
            return [SELECT Id, Name, Industry 
                    FROM Account];
        } catch (Exception e) {
            System.debug('Error in getAccounts: ' + e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Contact> getContacts(List<String> accountIds){
        try{
            return [SELECT Id, Name, AccountId FROM Contact WHERE AccountId IN :accountIds];
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Opportunity> getOpportunities(List<String> accountIds){
        try{            
			return [SELECT Id, Name, AccountId FROM Opportunity WHERE AccountId IN :accountIds];
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
}