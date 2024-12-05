/**
* @File Name : LWC1001Accounts.cls
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

public class LWC1001Accounts {
	@AuraEnabled(cacheable=true)
	Public static List<Account> getAccounts(String searchKey){
		try{
			return[SELECT Id, Name, Industry FROM Account WHERE Name LIKE :('%' + searchKey + '%') LIMIT 50];
		}
		catch(Exception e){
			throw new AuraHandledException(e.getMessage());
		}
	}
}