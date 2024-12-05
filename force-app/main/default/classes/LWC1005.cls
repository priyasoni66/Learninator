/**
* @File Name : LWC1005.cls
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

public class LWC1005 {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Industry, Phone FROM Account LIMIT 100];
    }


	@AuraEnabled
	Public static void deleteSelectedAccounts(List<Id> accountIds){
		try{
	        delete [SELECT Id, Name, Industry FROM Account WHERE Id IN :accountIds];
		}
		catch(Exception e){
			throw new AuraHandledException(e.getMessage());
		}
	}
}